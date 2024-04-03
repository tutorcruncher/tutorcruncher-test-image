# tutorcruncher-test-image

Base image for testing TutorCruncher.

Available on docker hub: [tutorcruncher/tutorcruncher-test-image](https://hub.docker.com/r/tutorcruncher/tutorcruncher-test-image/).

Tag names should include python version and node version, e.g. `py311node14`.

```
sudo docker login

sudo docker build -t tutorcruncher/tutorcruncher-test-image:latest .
sudo docker build -t tutorcruncher/tutorcruncher-test-image:py311node14 .
sudo docker push tutorcruncher/tutorcruncher-test-image:latest
sudo docker push tutorcruncher/tutorcruncher-test-image:py311node14
```
