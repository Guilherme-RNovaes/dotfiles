local status, comment = pcall(require, "Comment")
if (not status) then return end


comment.setup(
  {
    ---Add a space b/w comment and thh line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '\\cc',
        ---Block-comment toggle keymap
        block = '\\bc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '\\cc',
        ---Block-comment keymap
        block = '\\bc',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `\\cc` `\\bc` `cc[count]{motion}` `bc[count]{motion}`
        basic = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
  }
)
