ARG ROOT_CONTAINER=ubuntu:focal-20200703@sha256:d5a6519d9f048100123c568eb83f7ef5bfcad69b01424f420f17c932b00dea76
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

LABEL maintainer="feliux - ahdsbd@outlook.com"
LABEL name="qc-program"
LABEL version="1.0.0"
LABEL description="Image based on Jupyter Docker Stacks for running quantum computing notebooks"

ARG NB_USER="quantum"
ARG NB_UID="1000"
ARG NB_GID="100"
ARG PYTHON_VERSION=default

ENV DEBIAN_FRONTEND noninteractive
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=$NB_USER \
    NB_UID=$NB_UID \
    NB_GID=$NB_GID \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER
ENV MINICONDA_VERSION=4.8.2 \
    MINICONDA_MD5=87e77f097f6ebb5127c77662dfc3165e \
    CONDA_VERSION=4.8.2


USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    run-one \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Copy a script that we will use to correct permissions after running certain commands
COPY fix_permissions /usr/local/bin/fix_permissions
RUN chmod a+rx /usr/local/bin/fix_permissions

# Enable prompt color in the skeleton .bashrc before creating the default NB_USER
RUN sed -i 's/^#force_color_prompt=yes/force_color_prompt=yes/' /etc/skel/.bashrc

# Create NB_USER wtih name jovyan user with UID=1000 and in the 'users' group
# and make sure these dirs are writable by the `users` group.
RUN echo "auth requisite pam_deny.so" >> /etc/pam.d/su && \
    sed -i.bak -e 's/^%admin/#%admin/' /etc/sudoers && \
    sed -i.bak -e 's/^%sudo/#%sudo/' /etc/sudoers && \
    useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    mkdir -p $CONDA_DIR && \
    chown $NB_USER:$NB_GID $CONDA_DIR && \
    chmod g+w /etc/passwd && \
    fix_permissions $HOME && \
    fix_permissions $CONDA_DIR

USER $NB_UID
WORKDIR $HOME

# Setup work directory for backward-compatibility
RUN mkdir /home/$NB_USER/work && \
    fix_permissions /home/$NB_USER

# Install conda as previous user and check the md5 sum provided on the download site
WORKDIR /tmp
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-py37_${MINICONDA_VERSION}-Linux-x86_64.sh && \
    echo "${MINICONDA_MD5} *Miniconda3-py37_${MINICONDA_VERSION}-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash Miniconda3-py37_${MINICONDA_VERSION}-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-py37_${MINICONDA_VERSION}-Linux-x86_64.sh && \
    echo "conda ${CONDA_VERSION}" >> $CONDA_DIR/conda-meta/pinned && \
    conda config --system --prepend channels conda-forge && \
    conda config --system --set auto_update_conda false && \
    conda config --system --set show_channel_urls true && \
    conda config --system --set channel_priority strict && \
    if [ ! $PYTHON_VERSION = 'default' ]; then conda install --yes python=$PYTHON_VERSION; fi && \
    conda list python | grep '^python ' | tr -s ' ' | cut -d '.' -f 1,2 | sed 's/$/.*/' >> $CONDA_DIR/conda-meta/pinned && \
    conda install --quiet --yes conda && \
    conda install --quiet --yes pip && \
    conda update --all --quiet --yes && \
    conda clean --all -f -y && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    fix_permissions $CONDA_DIR && \
    fix_permissions /home/$NB_USER


# Install Tini
RUN conda install --quiet --yes 'tini=0.18.0' && \
    conda list tini | grep tini | tr -s ' ' | cut -d ' ' -f 1,2 >> $CONDA_DIR/conda-meta/pinned && \
    conda clean --all -f -y && \
    fix_permissions $CONDA_DIR && \
    fix_permissions /home/$NB_USER

# Install Jupyter Notebook, Lab, and Hub
# Generate a notebook server config
# Cleanup temporary files
# Correct permissions
# Do all this in a single RUN command to avoid duplicating all of the
# files across image layers when the permissions change
RUN conda install --quiet --yes \
    'notebook=6.0.3' \
    'jupyterhub=1.1.0' \
    'jupyterlab=2.1.3' && \
    conda clean --all -f -y && \
    npm cache clean --force && \
    jupyter notebook --generate-config && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    fix_permissions $CONDA_DIR && \
    fix_permissions /home/$NB_USER

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs-nox \
    vim-tiny \
    vim \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    python-dev \
    tree \
    tzdata \
    unzip \
    nano \
    curl \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    # Optional dependency
    texlive-fonts-extra \
    # ---- ffmpeg for matplotlib anim ----
    ffmpeg \
    # ---- dvipng for latex labels ----
    dvipng \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


USER $NB_UID

# Install Python 3 packages
RUN conda install --quiet --yes \
    'beautifulsoup4=4.9.*' \
    'conda-forge::blas=*=openblas' \
    'bokeh=2.0.*' \
    'bottleneck=1.3.*' \
    'cloudpickle=1.4.*' \
    'cython=0.29.*' \
    'dask=2.15.*' \
    'dill=0.3.*' \
    'h5py=2.10.*' \
    'hdf5=1.10.*' \
    'ipywidgets=7.5.*' \
    'ipympl=0.5.*'\
    'matplotlib-base=3.2.*' \
    # numba update to 0.49 fails resolving deps.
    'numba=0.48.*' \
    'numexpr=2.7.*' \
    'pandas=1.0.*' \
    'patsy=0.5.*' \
    'protobuf=3.11.*' \
    'pytables=3.6.*' \
    'scikit-image=0.16.*' \
    'scikit-learn=0.22.*' \
    'scipy=1.4.*' \
    'seaborn=0.10.*' \
    'sqlalchemy=1.3.*' \
    'statsmodels=0.11.*' \
    'sympy=1.5.*' \
    'vincent=0.4.*' \
    'widgetsnbextension=3.5.*'\
    'xlrd=1.2.*' \
    && \
    conda clean --all -f -y && \
    # Activate ipywidgets extension in the environment that runs the notebook server
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    # Also activate ipywidgets extension for JupyterLab
    # Check this URL for most recent compatibilities
    # https://github.com/jupyter-widgets/ipywidgets/tree/master/packages/jupyterlab-manager
    jupyter labextension install @jupyter-widgets/jupyterlab-manager@^2.0.0 --no-build && \
    jupyter labextension install @bokeh/jupyter_bokeh@^2.0.0 --no-build && \
    jupyter labextension install jupyter-matplotlib@^0.7.2 --no-build && \
    jupyter lab build -y && \
    jupyter lab clean -y && \
    npm cache clean --force && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    rm -rf "/home/${NB_USER}/.node-gyp" && \
    fix_permissions "${CONDA_DIR}" && \
    fix_permissions "/home/${NB_USER}"


# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix_permissions "/home/${NB_USER}"

USER root

# Julia dependencies
# Install Julia packages in /opt/julia instead of $HOME
ENV JULIA_DEPOT_PATH=/opt/julia
ENV JULIA_PKGDIR=/opt/julia
ENV JULIA_VERSION=1.5.0
WORKDIR /tmp

# hadolint ignore=SC2046
RUN mkdir "/opt/julia-${JULIA_VERSION}" && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/$(echo "${JULIA_VERSION}" | cut -d. -f 1,2)"/julia-${JULIA_VERSION}-linux-x86_64.tar.gz" && \
    echo "be7af676f8474afce098861275d28a0eb8a4ece3f83a11027e3554dcdecddb91 *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf "julia-${JULIA_VERSION}-linux-x86_64.tar.gz" -C "/opt/julia-${JULIA_VERSION}" --strip-components=1 && \
    rm "/tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz"
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# Show Julia where conda libraries are \
RUN mkdir /etc/julia && \
    echo "push!(Libdl.DL_LOAD_PATH, \"$CONDA_DIR/lib\")" >> /etc/julia/juliarc.jl && \
    # Create JULIA_PKGDIR \
    mkdir "${JULIA_PKGDIR}" && \
    chown "${NB_USER}" "${JULIA_PKGDIR}" && \
    fix_permissions "${JULIA_PKGDIR}"

USER $NB_UID

# Install IJulia as $NB_UID and then move the kernelspec out
# to the system share location. Avoids problems with runtime UID change not
# taking effect properly on the .local folder in the $NB_UID home dir.
RUN julia -e 'import Pkg; Pkg.update()' && \
    (test $TEST_ONLY_BUILD || julia -e 'import Pkg; Pkg.add("HDF5")') && \
    julia -e "using Pkg; pkg\"add IJulia\"; pkg\"precompile\"" && \
    # move kernelspec out of home \
    mv "${HOME}/.local/share/jupyter/kernels/julia"* "${CONDA_DIR}/share/jupyter/kernels/" && \
    chmod -R go+rx "${CONDA_DIR}/share/jupyter" && \
    rm -rf "${HOME}/.local" && \
    fix_permissions "${JULIA_PKGDIR}" "${CONDA_DIR}/share/jupyter"

# Install quantum packages and others from requirements file
WORKDIR $HOME
COPY requirements.txt .
RUN pip install -r requirements.txt && \
    rm -f requirements.txt

EXPOSE 8888

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD [ "jupyter" , "notebook",  "--ip=0.0.0.0", "--port=8888", "--no-browser" ]

# Fix permissions on /etc/jupyter as root
#USER root
#RUN fix_permissions /etc/jupyter/

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
WORKDIR $HOME
