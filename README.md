# dbt_bigquery_template
A repository template for dbt + BigQuery

## Tools

- dbt
  - [dbt-bigquery](https://github.com/dbt-labs/dbt-bigquery)
  - [dbt-rpc](https://github.com/dbt-labs/dbt-rpc) for [dbt language server](https://marketplace.visualstudio.com/items?itemName=Fivetran.dbt-language-server)
- Python
- gcloud CLI
- Linter/Formatter
  - `sql`: [sqlfluff](https://github.com/sqlfluff/sqlfluff)
  - `python`: [black](https://github.com/psf/black)
  - `shell`: [shellcheck](https://github.com/koalaman/shellcheck)
  - `yaml`: TBD
  - `json`: TBD
  - `dockerfile`: TBD
- Utilities
  - [direnv](https://github.com/direnv/direnv)
  - [pre-commit](https://github.com/pre-commit/pre-commit)

## VSCode extensions

- [Wizard for dbt Core (TM)](https://marketplace.visualstudio.com/items?itemName=Fivetran.dbt-language-server)
- [BigQuery Runner](https://marketplace.visualstudio.com/items?itemName=minodisk.bigquery-runner)
- [sqlfluff](https://marketplace.visualstudio.com/items?itemName=dorzey.vscode-sqlfluff)
- [Bash IDE](https://marketplace.visualstudio.com/items?itemName=mads-hartmann.bash-ide-vscode)
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)

## Getting started

### Authentication using gcloud CLI

dbt uses the Python client library to query BigQuery, so use the following command to generate [Application Default Credentials](https://cloud.google.com/docs/authentication/application-default-credentials). This command generates `$HOME/.config/gcloud/application_default_credentials.json`, which is mounted on devcontainer.

``` sh
gcloud auth application-default login
```

If you also want to run the gcloud CLI in your development workflow, also run:

``` sh
gcloud auth login
```

### Create repository from template and open it from vscode

Create a new repository by clicking the ***"Use this template"*** button on github, then clone it to your local development environment. When you open the folder in vscode, a dialog will appear saying ***"Folder contains a Dev Container configuration file. Reopen folder to develop in a container."***. Click on ***"Reopen in Container"*** to start development.

### Create a dbt profile

To create a bigquery connection, run the following command and answer the questions. `.dbt/profiles.yml` will be generated.

``` sh
dbt init
```

Now dbt development can be done in a container. Let's see if we can run `dbt compile`.

``` sh
dbt compile
```

### Optional: Edit the project name in `dbt_project.yml`

The project name is set as `dbt_data` by default. If you want to change it, edit `dbt_project.yml`.

### Optional: Add python packages in `requirements.txt`

If you need additional python packages, or if you want to change the version of dbt, modify `requirements.txt`.
To reflect the changes, run ctrl-p ***"Dev Container: Rebuild container"*** in vscode to reopen the project in devcontainer.

### Optional: Enable pre-commit

To adapt linter/formatter at commit time, run the following command to enable `pre-commit`. Check .pre-commit-config.yml for the default pre-commit settings.

``` sh
pre-commit install
```

### Optional: Enable direnv

Project-local environment variables can be described in `.envrc`.
If you get an error that `.envrc` is blocked, run the following command to allow environment variables to be read.

``` sh
direnv allow .
```

## Reference repository

- [davidgasquez/dbt-devcontainer](https://github.com/davidgasquez/dbt-devcontainer)
- [yu-iskw/dbt-bigquery-project-template](https://github.com/yu-iskw/dbt-bigquery-project-template)
