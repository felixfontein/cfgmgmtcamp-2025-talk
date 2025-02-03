#!/bin/bash
ansible-navigator -vvv run \
    --execution-environment-image sops-ee \
    --pull-policy missing \
    --mode stdout \
    --execution-environment-volume-mounts \
        "$(gpgconf --list-dir agent-extra-socket):/root/.gnupg/S.gpg-agent:rw" \
    --container-options='--user=0' \
    playbook.yml

# Currently **BROKEN** due to https://github.com/ansible/ansible-runner/issues/1409
# Fix: https://github.com/ansible/ansible-runner/pull/1410
