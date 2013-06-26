# SkypeChat

Skype chat with command line interface.

## Install

    $ git clone https://github.com/jewel12/skype_chat.git
    $ cd skype_chat
    $ gem build skype_chat.gemspec
    $ gem install skype_chat-(VERSION).gem

## Usage

### Show chat list

    $ sky list
    > CHAT_ID TOPICNAME USERS

### Read chat

    $ sky read CHAT_ID

### Read chat stream

    $ sky stream CHAT_ID

### Send a message

    $ sky send CHAT_ID
