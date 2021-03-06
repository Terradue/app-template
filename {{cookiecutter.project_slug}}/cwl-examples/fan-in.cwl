$graph:
- baseCommand: {{cookiecutter.project_slug|replace('_', '-')}}
  hints:
    DockerRequirement:
      dockerPull: {{cookiecutter.docker_repo}}/{{cookiecutter.project_slug}}:0.1
  class: CommandLineTool
  id: clt
  inputs:
    inp1:
      inputBinding:
        position: 1
        prefix: --input_references
      type: Directory
    inp2:
      inputBinding:
        position: 2
        prefix: --aoi
      type: string
  outputs:
    results:
      outputBinding:
        glob: .
      type: Directory
  requirements:
    EnvVarRequirement:
      envDef:
        PATH: /opt/anaconda/envs/env_{{cookiecutter.project_slug}}/bin:/opt/anaconda/bin:/usr/share/java/maven/bin:/opt/anaconda/bin:/opt/anaconda/envs/notebook/bin:/opt/anaconda/bin:/usr/share/java/maven/bin:/opt/anaconda/bin:/opt/anaconda/condabin:/opt/anaconda/bin:/usr/lib64/qt-3.3/bin:/usr/share/java/maven/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
        PREFIX: /opt/anaconda/envs/{{cookiecutter.project_slug}}
    ResourceRequirement: {}
  stderr: std.err
  stdout: std.out
- class: Workflow
  doc: {{cookiecutter.project_description}}
  id: {{cookiecutter.project_slug|replace('_', '-')}}
  inputs:
    aoi:
      doc: Area of interest in WKT
      label: Area of interest
      type: string
    input_reference:
      doc: EO product for vegetation index
      label: EO product for vegetation index
      type: Directory[]
  label: {{cookiecutter.project_title}}
  outputs:
  - id: wf_outputs
    outputSource:
    - node_1/results
    type:
      Directory
  steps:
    node_1:
      in:
        inp1: input_references
        inp2: aoi
      out:
      - results
      run: '#clt'
cwlVersion: v1.0
