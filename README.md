# Auto Pull Request

This Action was created before GitHub CLI was an option. We believe there are now better options for creating pull requests using GitHub Actions.

We recommend using GitHub CLI directly in your workflow file. See: [`gh pr create`](https://cli.github.com/manual/gh_pr_create)

For example:

```yaml
name: Auto Pull Request

on:
  push:
    branches:
      - features

permissions:
  pull-requests: write

jobs:
  auto-pr:
    runs-on: ubuntu-latest
    steps:
      - name: Create PR
        uses: offensive-vk/auto-pull-request@master
        with:
          github_token: ${{ secrets.BOT_TOKEN }}
          destination_branch: "master"
          pr_title: "${{ github.workflow }} - (${{ github.event.head_commit.message }})"
          pr_body: "Hamster is working really hard here."
          pr_reviewer: "offensive-vk"
          pr_label: "bot,automated,hamster,pull-request"
          pr_assignee: "TheHamsterBot"
          pr_draft: false

  gh-pull-request:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: pull-request
        run: |
          gh_pr_up() { gh pr create $* || gh pr edit $* }
          gh_pr_up --title "Auto Pull Request" --body "Long Description"
```

Refer to the [`gh pr create`](https://cli.github.com/manual/gh_pr_create) docs for further options. Read ["Defining outputs for jobs"](https://docs.github.com/en/actions/using-jobs/defining-outputs-for-jobs) to define outputs. As a result of ["GitHub Actions – Updating the default GITHUB_TOKEN permissions to read-only"](https://github.blog/changelog/2023-02-02-github-actions-updating-the-default-github_token-permissions-to-read-only/), you will need both the `permissions:` entry and to update your repository settings.
