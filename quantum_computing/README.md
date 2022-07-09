# Quantum Computing Projects

This repository contains some code and usefull documentation about quantum computing.

**TODO**

- Improve code for numpy circuits.

- Review notebooks for Julia [here](quantum_cryptography/1_ToReview.ipynb).

- Review notebooks for QML [here](quantum_machine_learning)

- Reduce docker image disk space usage.

- Add built-in packages for quantum computing.

## Components

- Jupyter notebooks.

- Docker environment with Python, Julia and all necessary packages for quantum computing.

## Usage

Build the image based on Jupyter Docker Stacks

`docker build --no-cache=true -t quantum/qc-stack:1.0.0 .`

- Run your container

`docker run -d --name <ContainerName> -v $PWD/<NotebooksPath>:/home/quantum/work -p 8888:8888 quantum/qc-stack:1.0.0`

- Connect to your notebook

`docker exec -t <ContainerName> jupyter-notebook list`

- Paste url/token in your favourite browser.

## References

[Knowledge base](https://www.quantum-inspire.com/kbase/introduction-to-quantum-computing/)

### VQE

[Variational Quantum Eigensolver explained](https://www.mustythoughts.com/variational-quantum-eigensolver-explained)

[Variational-Quantum-Eigensolver (VQE)](https://grove-docs.readthedocs.io/en/latest/vqe.html)

[Variational Quantum Eigensolver (VQE)](https://quantaggle.com/algorithms/algorithm/)

[Cost function features and VQE](https://docs.entropicalabs.io/qaoa/notebooks/4_costfunctionsandvqe)

[Simulating Molecules using VQE](https://qiskit.org/textbook/ch-applications/vqe-molecules.html)

[The Variational Quantum Eigensolver](https://medium.com/qiskit/the-variational-quantum-eigensolver-43f7718c2747)

### Examples

[Kaggle Quantum Computing Introduction using Python](https://www.kaggle.com/ashishpatel26/quantum-computing-introduction-using-python)

[CNOT quantum gate on python with numpy](https://stackoverflow.com/questions/61860538/cnot-quantum-gate-on-python-with-numpy)
