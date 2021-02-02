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

## Dump the CWL

Thanks to `click2cwl` module, dump the CWL and parameters with the additional arguments:

```bash
docker run --rm -it {{cookiecutter.docker_repo}}/{{cookiecutter.project_slug}}:0.1 {{cookiecutter.project_slug|replace('_', '-')}} --dump cwl --docker {{cookiecutter.docker_repo}}/{{cookiecutter.project_slug}}:0.1
```

Use the `click2cwl` additional flags below: 

- `--dump` `cwl`|`params`|`clt`. Example `--dump cwl --dump params` will dump the CWL document and the CWL parameters template in YAML. `clt` will dump the CWl `CommandLineTool` class only (no Workflow)
- `--requirement` with `requirement=value` where requirement here is one of `"coresMin"`, `"coresMax"`, `"ramMin"`, `"ramMax"`. Example: 
 `--requirement ramMax=1 --requirement ramMin=2`
- `--docker <docker image>` if set, the `DockerRequirement` hint is set to pull the `<docker image>`
- `--env` sets environment variables in the CWL with `env_var=env_var_value`. Example `--env A=1 --env B=2` where A and B are the environment variables to set in the CWL `EnvVarRequirement` requirement


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
