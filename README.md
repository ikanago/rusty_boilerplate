# rusty_boilerplate

[![CI](https://github.com/ikanago/issue-deadline-manager/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/ikanago/issue-deadline-manager/actions/workflows/ci.yml)
[![Build Docker image](https://github.com/ikanago/issue-deadline-manager/actions/workflows/build_image.yml/badge.svg?branch=main)](https://github.com/ikanago/issue-deadline-manager/actions/workflows/build_image.yml)
[![action lint](https://github.com/ikanago/rusty_boilerplate/actions/workflows/action_lint.yml/badge.svg?branch=main)](https://github.com/ikanago/rusty_boilerplate/actions/workflows/action_lint.yml)
[![hadolint](https://github.com/ikanago/rusty_boilerplate/actions/workflows/hadolint.yml/badge.svg?branch=main)](https://github.com/ikanago/rusty_boilerplate/actions/workflows/hadolint.yml)
[![Validate renovate config](https://github.com/ikanago/rusty_boilerplate/actions/workflows/validate-renovate.yml/badge.svg?branch=main)](https://github.com/ikanago/rusty_boilerplate/actions/workflows/validate-renovate.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This is a template repository for cargo project. This includes
* Minimal cargo project
* Dockerfile utilizing multi-stage build powered by [cargo-chef](https://github.com/LukeMathWalker/cargo-chef)
* CI workflows to test, build-push image, and lint.

## How to use
1. Follow instructions here to create repository: [Creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
2. Replace all strings `rusty_boilerplate` in this repository with your new project name.

