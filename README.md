# run circleci-cli build locally.

How to run:

circleci local execute build

Result:

====>> run lint
  #!/bin/bash -eo pipefail

. venv/bin/activate

make lint           

hadolint flask-sklearn-student-starter/Dockerfile

pylint --disable=R,C,W1203 ./\**\/**.py

------------------------------------
Your code has been rated at 10.00/10

Success!
