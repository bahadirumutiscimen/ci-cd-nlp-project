.PHONY: install test lint format all

install:
	pip install --upgrade pip && pip install -r requirements.txt
	python -m textblob.download_corpora

test:
	python -m pytest -vv --cov=core_nlp test.py

lint:
	pylint --disable=R,C app.py core_nlp.py wikiphrases.py

format:
	black app.py core_nlp.py wikiphrases.py

all: install lint test