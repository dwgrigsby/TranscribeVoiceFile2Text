# Contributing to the TranscribeVoiceFile2Text project, following much of what the curl community has established - https://github.com/curl/curl/. 

This document is intended to offer guidelines on how to best contribute to the
TranscribeVoiceFile2Text project. This concerns new features as well as corrections to existing
flaws or bugs.

## Learning TranscribeVoiceFile2Text

### Join the Community once available when the project has critical mass and contributors.

Keep watch and once we have critical mass we will create a the appropriate mailing list for you to  join
the appropriate mailing list(s).  Read up on details before you post
questions. Read this file before you start sending patches! We prefer
questions sent to and discussions being held on the mailing list(s), not sent
to individuals.

Before posting to one of the TranscribeVoiceFile2Text mailing lists, please read up on the[mailing list etiquette](WIP).


If you're at all interested in the code side of things, consider clicking
'watch' on the [curl repo on github](https://github.com/dwgrigsby/TranscribeVoiceFile2Text) to be
notified of pull requests and new issues posted there.

### License and copyright

When contributing with code, you agree to put your changes and new code under
the same license TranscribeVoiceFile2Text is already using unless stated and agreed
otherwise.

If you add a larger piece of code, you can opt to make that file or set of
files to use a different license as long as they don't enforce any changes to
the rest of the package and they make sense. 

When changing existing source code, you do not alter the copyright of the
original file(s). The copyright will still be owned by the original creator(s)
or those who have been assigned copyright by the original author(s).

By submitting a patch to the TranscribeVoiceFile2Text project, you are assumed to have the right
to the code and to be allowed by your employer or whatever to hand over that
patch/code to us. We will credit you for your changes as far as possible, to
give credit but also to keep a trace back to who made what changes. Please
always provide us with your full real name when contributing!

### What To Read

Source code, wiki, issues and related documentation and blog articles linked in the wiki.

## Write a good patch

### Follow code style

When writing code, follow the
style that already established in the project. Consistent style makes code easier to read and mistakes less
likely to happen. 

### Non-clobbering All Over

When you write new functionality or fix bugs, it is important that you don't
fiddle all over the source files and functions. Remember that it is likely
that other people have done changes in the same source files as you have and
possibly even in the same functions. If you bring completely new
functionality, try writing it in a new source file. If you fix bugs, try to
fix one bug at a time and send them as separate patches.

### Write Separate Changes

It is annoying when you get a huge patch from someone that is said to fix 511
odd problems, but discussions and opinions don't agree with 510 of them - or
509 of them were already fixed in a different way. Then the person merging
this change needs to extract the single interesting patch from somewhere
within the huge pile of source, and that creates a lot of extra work.

Preferably, each fix that corrects a problem should be in its own patch/commit
with its own description/commit message stating exactly what they correct so
that all changes can be selectively applied by the maintainer or other
interested parties.

Also, separate changes enable bisecting much better for tracking problems
and regression in the future.

### Patch Against Recent Sources

Please try to get the latest available sources to make your patches against.
It makes the lives of the developers so much easier. The very best is if you
get the most up-to-date sources from the git repository, but the latest
release archive is quite OK as well!

### Documentation

Writing docs is dead boring and one of the big problems with many open source
projects. But someone's gotta do it! It makes things a lot easier if you
submit a small description of your fix or your new features with every
contribution so that it can be swiftly added to the package documentation.

The documentation is always made in man pages (nroff formatted) or plain
ASCII files. All HTML files on the web site and in the release archives are
generated from the nroff/ASCII versions.

### Test Cases

Since the introduction of the test suite, we can quickly verify that the main
features are working as they're supposed to. To maintain this situation and
improve it, all new features and functions that are added need to be tested
in the test suite. Every feature that is added should get at least one valid
test case that verifies that it works as documented. If every submitter also
posts a few test cases, it won't end up as a heavy burden on a single person!

If you don't have test cases or perhaps you have done something that is very
hard to write tests for, do explain exactly how you have otherwise tested and
verified your changes.

## Sharing Your Changes

### How to get your changes into the main sources

Ideally you file a [pull request on
github](https://github.com/dwgrigsby/TranscribeVoiceFile2Text/pulls).

Your change will be reviewed and discussed and you will be
expected to correct flaws pointed out and update accordingly, or the change
risks stalling and eventually just getting deleted without action. As a
submitter of a change, you are the owner of that change until it has been merged.

Respond on the list or on github about the change and answer questions and/or
fix nits/flaws. This is very important. We will take lack of replies as a
sign that you're not very anxious to get your patch accepted and we tend to
simply drop such changes.

### About pull requests

With github it is easy to send a [pull
request](https://github.com/dwgrigsby/TranscribeVoiceFile2Text/pulls) to the TranscribeVoiceFile2Text project to have
changes merged.

We accept only pull requests to mailed patches, as it makes it a proper
git commit that is easy to merge and they are easy to track.

Every pull request submitted will automatically be tested in several different
ways. Every pull request is verified for each of the following:

 - ... it still runs / builds, warning-free, on macOS, Windows, and Linux, with respective shells and language runtimes.
 - ... it follows rudimentary code style rules
 - ... the test suite still runs 100% fine
 - ... the release (the "dist") still works
 - ... code coverage doesn't shrink drastically

If the pull-request fails one of these tests, it will show up as a red X and
you are expected to fix the problem. If you don't understand where the issue is
or have other problems to fix the complaint, just ask and other project
members and they will likely be able to help out.

When you adjust your pull requests after review, consider squashing the
commits so that we can review the full updated version more easily.

### Making quality patches

Make the patch against as recent source versions as possible.

If you've followed the tips in this document and your patch still hasn't been
incorporated or responded to after some weeks, consider resubmitting it.

### Write good commit messages

A short guide to how to write commit messages in the TranscribeVoiceFile2Text project.

    ---- start ----
    [area]: [short line describing the main effect]
           -- empty line --
    [full description, no wider than 72 columns that describe as much as
    possible as to why this change is made, and possibly what things
    it fixes and everything else that is related]
           -- empty line --
    [Closes/Fixes #1234 - if this closes or fixes a github issue]
    [Bug: URL to source of the report or more related discussion]
    [Reported-by: John Doe - credit the reporter]
    [whatever-else-by: credit all helpers, finders, doers]
    ---- stop ----

Don't forget to use commit --author="" if you commit someone else's work, and
make sure that you have your own user and email setup correctly in git before
you commit

### How To Make a Patch with git

You need to first checkout the repository:

    git clone https://github.com/dwgrigsby/TranscribeVoiceFile2Text.git

You then proceed and edit all the files you like and you commit them to your
local repository:

    git commit [file]

As usual, group your commits so that you commit all changes at once that
constitute a logical change.

Once you have done all your commits and you're happy with what you see, you
can make patches out of your changes that are suitable for mailing:

    git format-patch remotes/origin/master

This creates files in your local directory named NNNN-[name].patch for each
commit.

