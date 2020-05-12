# Bitbucket Pipelines Pipe: SonarCloud scan

Scan your code with [SonarCloud](https://sonarcloud.io) to detects bugs, vulnerabilities and code smells in more than 25 programming languages.

Your SonarCloud account must first be associated to your Bitbucket team or user account. SonarCloud is totally free for open-source projects. If your code is closed source, SonarCloud also offers a paid plan to run private analyses.

_NOTE: For projects using Maven or Gradle please execute a respective scanner directly instead of using this pipe (see [examples](https://bitbucket.org/account/user/sonarsource/projects/SAMPLES))._

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: sonarsource/sonarcloud-scan:1.1.0
  # variables:
  #   SONAR_TOKEN: '<string>'  # Optional
  #   EXTRA_ARGS: '<string>'  # Optional
  #   SONAR_SCANNER_OPTS: '<string>'  # Optional
  #   DEBUG: '<boolean>'  # Optional
```

## Variables

| Variable           | Usage                                                                                                                                                                                 |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SONAR_TOKEN (\*)   | SonarCloud token. It is recommended to use a secure repository or account variable. And in this case there is no need to specify this variable in the `bitbucket-pipelines.yml` file. |
| EXTRA_ARGS         | Extra analysis parameters (check [docs](https://sonarcloud.io/documentation/analysis/analysis-parameters/))                                                                           |
| SONAR_SCANNER_OPTS | Scanner JVM options (e.g. "-Xmx256m")                                                                                                                                                 |
| DEBUG              | Turn on extra debug information. Default: `false`.                                                                                                                                    |

_(\*) = required variable._

## Details

This pipe encapsulates the execution of SonarCloud code analyzer in order to detect bugs, vulnerabilities and code smells. SonarCloud can then decorate your Pull Requests and report back with code quality information. Getting started guide available here: [Get started with Bitbucket Cloud](https://sonarcloud.io/documentation/integrations/bitbucketcloud/).

## Prerequisites

To use this pipe you have to set up a project on SonarCloud, then use the generated token in a secure variable named `SONAR_TOKEN` on your repository or team/personal Bitbucket Account.

## Examples

Basic example:

```yaml
- pipe: sonarsource/sonarcloud-scan:1.1.0
```

A bit more advanced example:

```yaml
- pipe: sonarsource/sonarcloud-scan:1.1.0
  variables:
    EXTRA_ARGS: -Dsonar.projectDescription=\"Project with sonarcloud-scan pipe\" -Dsonar.eslint.reportPaths=\"report.json\"
    SONAR_SCANNER_OPTS: -Xmx512m
    DEBUG: "true"
```

This example uses a custom description of the project on SonarCloud, reads the report produced by eslint, sets maximum memory to 512MB, and enables verbose output.

## Support

If you would like help with this pipe, or you have an issue or feature request, [let us know on our community forum](https://community.sonarsource.com/tags/c/help/sc/bitbucket).

If you are reporting an issue, please include:

- the version of the pipe
- relevant logs and error messages
- steps to reproduce
