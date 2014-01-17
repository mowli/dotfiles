" CommandT
if has("gui_macvim")
  " Command-T for CommandT
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>

  " Command-Shift-F for Ack
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>
  map <D-F> :Ack<space>
endif
