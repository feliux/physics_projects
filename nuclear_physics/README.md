## Labs

1. Caracterización de un contador Geiger-Muller

2. Estadística aplicada a medidas nucleares.


## Generate report

Open [README.ipynb](README.ipynb) and run the following cells to generate a document file.

### Generate pdf

~~~
!jupyter nbconvert --to pdf --config nbconvert_nuclear_config.py --output nuclear_nbconvert.pdf
~~~

### Generate tex

~~~
!jupyter nbconvert --to latex --config nbconvert_nuclear_config.py
~~~

In order to generate a pdf with custom information

1. Add to `.tex` file the following info

~~~
    % Document title
    \title{University}
    \author{My name}
    \date{Today}   
~~~

2. Compile `.tex` file to `.pdf` with TexStudio or something similar.