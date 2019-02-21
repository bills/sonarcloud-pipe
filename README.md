# Bitbucket Pipelines Pipe: sonarcloud-scan
Pipe that starts a code scan on SonarCloud.

_NOTE: For projects using Maven or Gradle please execute a respective scanner directly instead of using this pipe (see [examples](https://bitbucket.org/account/user/sonarsource/projects/SAMPLES))._

## YAML Definition
Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: sonarsource/sonarcloud-scan:0.1.4
  variables:
    SONAR_TOKEN: ${SONAR_TOKEN} # Use a secure repository or account variable
    # EXTRA_ARGS: "<string>" # Optional.
    # SONAR_SCANNER_OPTS: "<string>" # Optional.
    # DEBUG: "<boolean>" # Optional.
```

## Variables
| Variable           | Usage                                                       |
| --------------------- | ----------------------------------------------------------- |
| SONAR_TOKEN (*) | SonarCloud token. It is recommended to use a secure repository or account variable.  |
| EXTRA_ARGS      | Extra analysis parameters (check [docs](https://sonarcloud.io/documentation/analysis/analysis-parameters/)) |
| SONAR_SCANNER_OPTS      | Scanner JVM options (e.g. "-Xmx256m") |
| DEBUG           | Turn on extra debug information. Default: `false`. | 

_(*) = required variable._

## Details
This pipe triggers code scan on [SonarCloud](https://sonarcloud.io). SonarCloud is a cloud service that inspects the quality of source code and detects bugs, vulnerabilities and code smells in more than 20 different languages.

## Prerequisites
To use this pipe you have to set up a project on SonarCloud and configure a secure variable named `SONAR_TOKEN` on your repository or team/personal Bitbucket Account. Please check [this page](https://sonarcloud.io/documentation/integrations/bitbucketcloud/) for more information.

## Examples
Basic example:

```yaml
- pipe: sonarsource/sonarcloud-scan:0.1.4
  variables:
    SONAR_TOKEN: ${SONAR_TOKEN}
```

A bit more advanced example:

```yaml
- pipe: sonarsource/sonarcloud-scan:0.1.4
  variables:
    SONAR_TOKEN: ${SONAR_TOKEN}
    EXTRA_ARGS: -Dsonar.projectDescription=\"Project with sonarcloud-scan pipe\" -Dsonar.eslint.reportPaths=\"report.json\"
    SONAR_SCANNER_OPTS: -Xmx512m
    DEBUG: "true"
```

## Support
If you would like help with this pipe, or you have an issue or feature request, [let us know on our community forum](https://community.sonarsource.com/tags/bitbucket).

If you arere reporting an issue, please include:

* the version of the pipe
* relevant logs and error messages
* steps to reproduce
