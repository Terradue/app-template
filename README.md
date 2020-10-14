# app-template

## Quickstart

Install the latest Cookiecutter if you haven't installed it yet (this requires Cookiecutter 1.4.0 or higher):

```bash
conda install -y cookiecutter
```
   
Generate a Python package project:

```bash
cookiecutter https://github.com/EOEPCA/app-template.git
```

You'll be asked for:

* project_name - this is the project name
* project_slug - this is the project slug, cookiecutter suggests one based on the `project_name` value
* project_title - this is the project title
* project_description - this is the project description
* docker_repo - this is the docker hub organization or the docker repo root