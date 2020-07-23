setup:
	python3 -m venv ~/.DelayAlert

install:
	pip install --upgrade pip &&\
    	pip install -r requirements.txt

test:
	python -m pytest main.py

lint:
	pylint --disable=C0114 main.py

all:
	install lint test