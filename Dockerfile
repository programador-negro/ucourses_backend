FROM python:3.9.6


# es una variable de entorno diciéndole a Docker que nos muestre el Standart Output(salida) y Standart Error(errores) en la terminal como estamos acostumbrados
ENV PYTHONUNBUFFERED=1

# crea un directorio llamado code
WORKDIR /code

COPY requirements.txt /code/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /code/