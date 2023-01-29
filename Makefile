setup:

	python3 -m venv .venv
	. .venv/bin/activate
	# can not source/activate python venv with make
	# circleci config.yml use:
	# python3 -m venv venv
	# . ./venv/bin/activate 


install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	#circleci local execute
	circleci local execute build

lint:
	hadolint flask-sklearn-student-starter/Dockerfile
	pylint --disable=R,C,W1203 ./**/**.py

all: install lint test
