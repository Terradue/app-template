# {{cookiecutter.project_name}} - {{cookiecutter.project_title}}

{{cookiecutter.project_description}}

## Development 

```bash
cd {{cookiecutter.project_slug}}
```

```bash
conda env create -f environment.yml
```

Activate the conda environment

```bash
conda activate  env_{{cookiecutter.project_slug}}
```

To build and install the project locally:

```
python setup.py install
```

Test the CLI with:

```bash
{{cookiecutter.project_slug|replace('_', '-')}} --help
```

## Building the docker image

Build the docker image with:

```bash
docker build -t {{cookiecutter.project_slug}}:0.1  -f .docker/Dockerfile .
```

or for pushing to the `{{cookiecutter.docker_repo}}` docker repository:

```bash
docker build -t {{cookiecutter.docker_repo}}/{{cookiecutter.project_slug}}:0.1  -f .docker/Dockerfile .
```

Test the CLI with:

```bash
docker run --rm -it {{cookiecutter.project_slug}}:0.1 {{cookiecutter.project_slug|replace('_', '-')}} --help
```

or 

```bash
docker run --rm -it {{cookiecutter.docker_repo}}/{{cookiecutter.project_slug}}:0.1 {{cookiecutter.project_slug|replace('_', '-')}} --help
```

## Creating the CWL

Check the examples provided in the `cwl-examples` folder and adapt one to the application requirements

## Setting up the git repository

```bash
git init
git remote add origin <git repository URL>
```

Once you're ready to add, commit and push, do:

```bash
git add -A
git commit -m 'first commit'
git push -u origin master
```
