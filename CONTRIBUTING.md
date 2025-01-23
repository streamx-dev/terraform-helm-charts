## Before you contribute

To contribute, use GitHub Pull Requests, from your **own** branch.

Also, make sure you have set up your Git authorship correctly:

```
git config --global user.name "Your Full Name"
git config --global user.email name.lastname@ds.pl
```

If you use different computers to contribute, please make sure the name is the same on all your
computers.

We use this information to acknowledge your contributions in release announcements.

## Language

Use US English.

## Branch naming

All changes in the project should be made on specific branches following the Git Flow model. Please
create a new branch with the following pattern:
>{branch type}/{description}

For example:

- `feature/add-the-new-feature`: If you are working on a new feature,
- `bugfix/fix-the-bug`: If you are working on a bug fix,
- `hotfix/fix-the-critical-bug`: If you are working on critical hotfixes,
- `release/version`: If you are releasing a version.

## Commits

Each commit should be reviewed for project compatibility and contain logically cohesive changes.
Please use squash commits to maintain a clear repository history.

## Commit messages

Each commit should have a short but clear description of the changes made. Include the
Jira issue key you are working on in the commit message.

## Pull requests

Each pull request (PR) title should contains a description of the changes.
Begin the description with a keyword that specifies the type of change provided, such as: 
>add, fix, improve, refactor, bump, clean, remove, or similar.

Please create a PR title with the following pattern:
>{Add/Improve/Fix/Remove/Bump}{description of the changes}

Example PR titles:

- Add a new fancy feature
- Improve an existing feature
- Fix a defect

Follow the [PR template](.github/pull_request_template.md) to fullfill all sufficient
information related to the changes.

The PR author is responsible for driving the approval process by addressing reviewer feedback,
incorporating necessary changes, and keeping the discussion active.

## Change acceptance

Every change must be reviewed by the StreamX team member and approved by the relevant individuals, 
who are recognized as code owners, before merging into the main branch. 
Please exercise patience during the review process.

Squash and merge is the only allowed method for merging.

## Branch management

To maintain the repository clean and to minimize conflicts, feature/bugfix/hotfix branches
will be automatically deleted when a change is finished and merged.
