commands =
  space: 'echo "$(~/.config/status.widget/scripts/spaces.sh)"'
  focus: 'echo "$(~/.config/status.widget/scripts/switcher.sh 2>/dev/null)"'

command: "echo " +
  "$(#{ commands.space }):::" +
  "$(#{ commands.focus })"

# original (singular) command:
#command: 'echo "$(./amar-bar.widget/scripts/spaces.sh)"'

refreshFrequency: 1000 # ms

render: ( ) ->
  """
  <div class="foc">
    <span></span>
  </div>
  """

# construct entire top-left: mode, list of spaces, focused window name
update: (output, el) ->
  # get the updated colors on space switch
  [output, _, bg, c1] = output.split ':::'
  new_style = @construct_style bg, c1

  # get monospaced spaces list:
  [_, spaces, _...] = output.split '|'
  spaces = (@format_active space, new_style for space in (spaces.split ' ')).join('')
  rendered = spaces
  $(".foc span").html("#{rendered}")

# truncates focused window title if too long
trunc_focused: (str, limit) ->
  return if (str.length < limit) then str else (str.substring(0,limit) + "...")

# checks if this number is the active space (will be surrounded by parens)
# adds class 'active' or 'inactive' and returns HTML
format_active: (elem, active_style) ->
  # elem.replace /^\s+|\s+$/g, ""
  if elem is ""
    return """ """
  else
    if elem[0] is "("
      elem = elem[1...-1]
      if (elem == "1")
          elem = "|"
      if (elem == "2")
          elem = "||"
      if (elem == "3")
          elem = "|||"
      if (elem == "4")
          elem = "||||"
      if (elem == "5")
          elem = "|||||"
      if (elem == "6")
          elem = "||||||"
      if (elem == "7")
          elem = "|||||||"
      if (elem == "8")
          elem = "||||||||"
      if (elem == "9")
          elem = "|||||||||"
      return """<span class="list active">#{ elem }</span>"""


# NOTE - Most theme resetting is done in theme.coffee
# create style attrs for the active space specifically
construct_style: (bg, c1) ->
  """
  style="
    color: #{c1};
    background-color: rgba(0,0,0,0)"
  """

style: """
  left: 20px
  font: 17px "Terminus (TTF)"
  font-weight: bold
  background-color: rgba(0,0,0,0)
  z-index: 0

"""
