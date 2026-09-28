# tutorcruncher-test-image

Base image for testing TutorCruncher.

Available on docker hub: [tutorcruncher/tutorcruncher-test-image](https://hub.docker.com/r/tutorcruncher/tutorcruncher-test-image/).

Tag names should include the ubuntu stack, python version and node version, e.g. `ub26.py311.node26`.

GitHub Actions builds and smoke-tests the image on every PR, and pushes `latest` plus the `TAG` set in
`.github/workflows/build.yml` to docker hub on merge to master (needs the `DOCKERHUB_USERNAME` and
`DOCKERHUB_TOKEN` repo secrets). Bump `TAG` whenever the stack, python or node version changes.

To build and push by hand instead:

```
sudo docker login

sudo docker build -t tutorcruncher/tutorcruncher-test-image:latest .
sudo docker build -t tutorcruncher/tutorcruncher-test-image:ub26.py311.node26 .
sudo docker push tutorcruncher/tutorcruncher-test-image:latest
sudo docker push tutorcruncher/tutorcruncher-test-image:ub26.py311.node26
```
