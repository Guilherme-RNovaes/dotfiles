# My Keymaps

## Windows Terminal

### splitPane
``` Json
{
    {
        "command": 
        {
            "action": "splitPane",
            "split": "horizontal",
            "splitMode": "duplicate"
        },
        "keys": "alt+shift+-"
    },
    {
        "command": 
        {
            "action": "splitPane",
            "split": "vertical",
            "splitMode": "duplicate"
        },
        "keys": "alt+shift+|"
    },
    {
        "command": 
        {
            "action": "closePane",
            "pane": "actual",
        },
        "keys": "ctrl+shift+w"
    },
}
```

### moveFocus
``` Json
{
    {
        "command": 
        {
            "action": "moveFocus",
            "direction": "nextInOrder",
        },
        "keys": "alt+shift+l"
    },
    {
        "command": 
        {
            "action": "moveFocus",
            "direction": "previousInOrder",
        },
        "keys": "alt+shift+h"
    },
}
```

### resizePane
``` Json
{
    {
        "command": 
        {
            "action": "resizePane",
            "direction": "down",
        },
        "keys": "ctrl+alt+j"
    },
    {
        "command": 
        {
            "action": "resizePane",
            "direction": "left",
        },
        "keys": "ctrl+alt+h"
    },
    {
        "command": 
        {
            "action": "resizePane",
            "direction": "right",
        },
        "keys": "ctrl+alt+l"
    },
    {
        "command": 
        {
            "action": "resizePane",
            "direction": "up",
        },
        "keys": "ctrl+alt+k"
    },
}
```

### tabActions
```Json
{
    {
        "command": 
        {
            "action": "newTab"
        },
        "keys": "ctrl+t"
    },
    {
        "command": 
        {
            "action": "closeTab"
        },
        "keys": "ctrl+w"
    } 
}
``` 

# Vim Keymaps

## Plugin: Comment
```Json
{
    {
        "command": 
        {
            "action": "comment"
            "type": "line"
        },
        "keys": "\\cc"
    },
    {
        "command": 
        {
            "action": "comment"
            "type": "block"
        },
        "keys": "\\bc"
    } 
}
``` 
