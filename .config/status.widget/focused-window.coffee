commands =
  focused: 'echo "$(~/.config/status.widget/scripts/spaces.sh)"'
  switcher: 'echo "$(~/.config/status.widget/scripts/switcher.sh 2>/dev/null)"'

command: "echo " +
  "$(#{ commands.focused }):::" +
  "$(#{ commands.switcher })"

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
  [active, _, bg, c1] = output.split ':::'
  new_style = @construct_style bg, c1

  # get monospaced spaces list:
  active = @format_active active
  $(".foc span").html("#{active}")

# truncates focused window title if too long
trunc_focused: (str, limit) ->
  return if (str.length < limit) then str else (str.substring(0,limit) + "...")

# checks if this number is the active space (will be surrounded by parens)
# adds class 'active' or 'inactive' and returns HTML
format_active: (elem) ->
  if elem is ""
    return """"""
  else
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
  left: 10px
  top: 1px
  font: 20px "IBM 3270"
  background-color: rgba(0,0,0,0)
  z-index: 0

"""
