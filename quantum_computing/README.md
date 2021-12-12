# Quantum Computing Projects

This repository contains some code and usefull documentation about quantum computing.

**TODO**

- Improve code for numpy circuits.

- Review notebooks for Julia [here](quantum_cryptography/1_ToReview.ipynb).

- Review notebooks for QML [here](quantum_machine_learning)

- Reduce docker image disk space usage.

- Add built-in packages for quantum computing.

### Components

- Jupyter notebooks.

- Docker environment with Python, Julia and all necessary packages for quantum computing.

### Usage

Build the image based on Jupyter Docker Stacks

`docker build --no-cache=true -t quantum/qc-stack:1.0.0 .`

- Run your container

`docker run -d --name <ContainerName> -v $PWD/<NotebooksPath>:/home/quantum/work -p 8888:8888 quantum/qc-stack:1.0.0`

- Connect to your notebook

`docker exec -t <ContainerName> jupyter-notebook list`

- Paste url/token in your favourite browser.