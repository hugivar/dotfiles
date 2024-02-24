-- -- Pull in the wezterm API
-- local wezterm = require 'wezterm'
-- local gpus = wezterm.gui.enumerate_gpus()

-- local format_title = function(title, is_active, max_width)
--     local background = {Background = {Color = '#1f1f28'}}
--     local title_len = #title
--     local pad_len = math.floor((max_width - title_len) / 2)

--     local formatted_title = {
--         Text = string.rep(' ', pad_len) .. title .. string.rep(' ', pad_len)
--     }
--     if is_active then
--         return {background, {Foreground = {Color = '#957fb8'}}, formatted_title}
--     else
--         return {background, {Foreground = {Color = '#cad3f5'}}, formatted_title}
--     end
-- end

-- local user_var_tab_title_key = 'tab_title';
-- wezterm.on('format-tab-title',
--            function(tab, tabs, panes, config, hover, max_width)
--     -- if there is title already set, proceed with it
--     if type(tab.tab_title) == 'string' and #tab.tab_title > 0 then
--         return format_title(tab.tab_title, tab.is_active, max_width)
--     end
--     return format_title('temp', tab.is_active, max_width)
-- end)

-- wezterm.on('update-right-status', function(window)
--     local date = wezterm.strftime '%Y-%m-%d %H:%M:%S'
--     window:set_right_status({Foreground = {Color = '#cad3f5'}},
--                             wezterm.format {{Text = ' ' .. date .. ' '}})
-- end)

-- wezterm.on('user-var-changed', function(window, pane, name, value)
--     wezterm.log_info('user-var-changed', name, value)
--     if name == user_var_tab_title_key then pane:tab():set_title(value) end
-- end)

-- -- This table will hold the configuration.
-- local config = {
--     webgpu_preferred_adapter = gpus[1],
-- 	front_end = "OpenGL",
--     font_size = 200.0,
--     font = wezterm.font 'SpaceMono Nerd Font',
--     -- dpi = 144.0,
--     tab_max_width = 30,
--     colors = {
--         tab_bar = {
--             -- The color of the inactive tab bar edge/divider
--             background = '#1f1f28',
--             new_tab = {bg_color = '#1f1f28', fg_color = '#dcd7ba'}
--         },

--         cursor_bg = '#c8c093',
--         cursor_fg = '#c8c093',
--         cursor_border = '#c8c093',

--         selection_fg = '#c8c093',
--         selection_bg = '#2d4f67',

--         scrollbar_thumb = '#16161d',
--         split = '#16161d',

--         ansi = {
--             '#090618',
--             '#c34043',
--             '#76946a',
--             '#c0a36e',
--             '#7e9cd8',
--             '#957fb8',
--             '#6a9589',
--             '#c8c093'
--         },
--         brights = {
--             '#727169',
--             '#e82424',
--             '#98bb6c',
--             '#e6c384',
--             '#7fb4ca',
--             '#938aa9',
--             '#7aa89f',
--             '#dcd7ba'
--         },
--         indexed = {[16] = '#ffa066', [17] = '#ff5d62'}
--     },
--     window_decorations = 'RESIZE'
-- }


local wezterm = require 'wezterm'

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Frappe"
  else
    return "Catppuccin Frappe"
  end
end

local config = {}
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 15.0
config.default_prog = { '/opt/homebrew/bin/nu' }
config.window_close_confirmation = "NeverPrompt"


return config