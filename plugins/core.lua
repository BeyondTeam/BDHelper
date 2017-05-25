--Begin Core.lua By #BeyondTeam
local function getindex(t,id) 
	for i,v in pairs(t) do 
		if v == id then 
			return i 
		end 
	end 
	return nil 
end 

local function reload_plugins( ) 
	plugins = {} 
	load_plugins() 
end

--By @SoLiD021
local function already_sudo(user_id)
	for k,v in pairs(_config.sudo_users) do
		if user_id == v then
			return k
		end
	end
	-- If not found
	return false
end

--By @SoLiD
local function sudolist(msg)
	local sudo_users = _config.sudo_users
	local text = "Sudo Users :\n"
	for i=1,#sudo_users do
		text = text..i.." - "..sudo_users[i].."\n"
	end
	return text
end

function moresetting(msg, data, GP_id)
local settings = data[tostring(GP_id)]["settings"]
local text = '_Welcome To_ *More Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '> Flood Sensitivity ', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '> Character Sensitivity ', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '> Flood Check Time ', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Back ', callback_data = '/settings:'..GP_id}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
end

function setting(msg, data, GP_id)
local settings = data[tostring(GP_id)]["settings"]
local text = '_Welcome To_ *Group Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Lock Edit", callback_data='BeyondTeam'}, 
			{text = settings.lock_edit, callback_data="/lockedit:"..GP_id}
		},
		{
			{text = "> Lock Link", callback_data='BeyondTeam'}, 
			{text = settings.lock_link, callback_data="/locklink:"..GP_id}
		},
		{
			{text = "> Lock Tags", callback_data='BeyondTeam'}, 
			{text = settings.lock_tag, callback_data="/locktags:"..GP_id}
		},
		{
			{text = "> Lock Join", callback_data='BeyondTeam'}, 
			{text = settings.lock_join, callback_data="/lockjoin:"..GP_id}
		},
		{
			{text = "> Lock Flood", callback_data='BeyondTeam'}, 
			{text = settings.flood, callback_data="/lockflood:"..GP_id}
		},
		{
			{text = "> Lock Spam", callback_data='BeyondTeam'}, 
			{text = settings.lock_spam, callback_data="/lockspam:"..GP_id}
		},
		{
			{text = "> Lock Mention", callback_data='BeyondTeam'}, 
			{text = settings.lock_mention, callback_data="/lockmention:"..GP_id}
		},
		{
			{text = "> Lock Arabic", callback_data='BeyondTeam'}, 
			{text = settings.lock_arabic, callback_data="/lockarabic:"..GP_id}
		},
		{
			{text = "> Lock Webpage", callback_data='BeyondTeam'}, 
			{text = settings.lock_webpage, callback_data="/lockwebpage:"..GP_id}
		},
		{
			{text = "> Lock Markdown", callback_data='BeyondTeam'}, 
			{text = settings.lock_markdown, callback_data="/lockmarkdown:"..GP_id}
		},
		{
			{text = "> Lock Pin", callback_data='BeyondTeam'}, 
			{text = settings.lock_pin, callback_data="/lockpin:"..GP_id}
		},
		{
			{text = "> Lock Bots", callback_data='BeyondTeam'}, 
			{text = settings.lock_bots, callback_data="/lockbots:"..GP_id}
		},
		{
			{text = "> Group Welcome", callback_data='BeyondTeam'}, 
			{text = settings.welcome, callback_data="/welcome:"..GP_id}
		},
		{
			{text = '> More Settings ', callback_data = '/moresettings:'..GP_id}
		},
		{
			{text = '> Back ', callback_data = '/option:'..GP_id}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
end

function mutelists(msg, data, GP_id)
	local mutes = data[tostring(GP_id)]["mutes"] 
	local text = '_Welcome To_ *Group Mutelist*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Mute All", callback_data='BeyondTeam'}, 
			{text = mutes.mute_all, callback_data="/muteall:"..GP_id}
		},
		{
			{text = "> Mute Gifs", callback_data='BeyondTeam'}, 
			{text = mutes.mute_gif, callback_data="/mutegif:"..GP_id}
		},
		{
			{text = "> Mute Text", callback_data='BeyondTeam'}, 
			{text = mutes.mute_text, callback_data="/mutetext:"..GP_id}
		},
		{
			{text = "> Mute Inline", callback_data='BeyondTeam'}, 
			{text = mutes.mute_inline, callback_data="/muteinline:"..GP_id}
		},
		{
			{text = "> Mute Game", callback_data='BeyondTeam'}, 
			{text = mutes.mute_game, callback_data="/mutegame:"..GP_id}
		},
		{
			{text = "> Mute Photo", callback_data='BeyondTeam'}, 
			{text = mutes.mute_photo, callback_data="/mutephoto:"..GP_id}
		},
		{
			{text = "> Mute Video", callback_data='BeyondTeam'}, 
			{text = mutes.mute_video, callback_data="/mutevideo:"..GP_id}
		},
		{
			{text = "> Mute Audio", callback_data='BeyondTeam'}, 
			{text = mutes.mute_audio, callback_data="/muteaudio:"..GP_id}
		},
		{
			{text = "> Mute Voice", callback_data='BeyondTeam'}, 
			{text = mutes.mute_voice, callback_data="/mutevoice:"..GP_id}
		},
		{
			{text = "> Mute Sticker", callback_data='BeyondTeam'}, 
			{text = mutes.mute_sticker, callback_data="/mutesticker:"..GP_id}
		},
		{
			{text = "> Mute Contact", callback_data='BeyondTeam'}, 
			{text = mutes.mute_contact, callback_data="/mutecontact:"..GP_id}
		},
		{
			{text = "> Mute Forward", callback_data='BeyondTeam'}, 
			{text = mutes.mute_forward, callback_data="/muteforward:"..GP_id}
		},
		{
			{text = "> Mute Location", callback_data='BeyondTeam'}, 
			{text = mutes.mute_location, callback_data="/mutelocation:"..GP_id}
		},
		{
			{text = "> Mute Document", callback_data='BeyondTeam'}, 
			{text = mutes.mute_document, callback_data="/mutedocument:"..GP_id}
		},
		{
			{text = "> Mute TgService", callback_data='BeyondTeam'}, 
			{text = mutes.mute_tgservice, callback_data="/mutetgservice:"..GP_id}
		},
		{
			{text = "> Mute Keyboard", callback_data='BeyondTeam'}, 
			{text = mutes.mute_keyboard, callback_data="/mutekeyboard:"..GP_id}
		},
		{
			{text = '> Back ', callback_data = '/option:'..GP_id}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
end

local function run(msg, matches)
	local data = load_data(_config.moderation.data)
--------------Begin Msg Matches---------------
	if matches[1] == "sudolist" and is_sudo(msg) then
		return sudolist(msg)
	end
	if tonumber(msg.from.id) == sudo_id then
		if matches[1]:lower() == "setsudo" then
			if matches[2] and not msg.reply_to_message then
				local user_id = matches[2]
				if already_sudo(tonumber(user_id)) then
					return 'User '..user_id..' is already sudo users'
				else
					table.insert(_config.sudo_users, tonumber(user_id)) 
					print(user_id..' added to sudo users') 
					save_config() 
					reload_plugins(true) 
					return "User "..user_id.." added to sudo users" 
				end
		elseif not matches[2] and msg.reply_to_message then
			local user_id = msg.reply_to_message.from.id
			if already_sudo(tonumber(user_id)) then
				return 'User '..user_id..' is already sudo users'
			else
				table.insert(_config.sudo_users, tonumber(user_id)) 
				print(user_id..' added to sudo users') 
				save_config() 
				reload_plugins(true) 
				return "User "..user_id.." added to sudo users" 
			end
		end
	end
	if matches[1]:lower() == "remsudo" then
	if matches[2] and not msg.reply_to_message then
		local user_id = tonumber(matches[2]) 
		if not already_sudo(user_id) then
			return 'User '..user_id..' is not sudo users'
		else
			table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
			print(user_id..' removed from sudo users') 
			save_config() 
			reload_plugins(true) 
			return "User "..user_id.." removed from sudo users"
		end
	elseif not matches[2] and msg.reply_to_message then
		local user_id = tonumber(msg.reply_to_message.from.id) 
		if not already_sudo(user_id) then
			return 'User '..user_id..' is not sudo users'
		else
			table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
			print(user_id..' removed from sudo users') 
			save_config() 
			reload_plugins(true) 
			return "User "..user_id.." removed from sudo users"
		end
	end
	end
	end
--------------End Msg Matches---------------

--------------Begin Inline Query---------------
if msg.query and msg.query:match("-%d+") and is_sudo(msg) then
	local chatid = "-"..msg.query:match("%d+")
	keyboard = {}
	keyboard.inline_keyboard = {
		{
			{text = ' Go To Group Option ', callback_data = '/option:'..chatid}
		},
		{
			{text= 'Exit' ,callback_data = '/exit:'..chatid}
		}					
	}
	send_inline(msg.id,'settings','Group Option','Tap Here','Please select an option.!',keyboard)
end
if msg.cb then
	if msg.callback_query then
		chatid = ('-'..msg.callback_query.data:match('(%d+)') or '')
	end
	if matches[1] == '/option' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
    elseif not data[tostring(matches[2])] then
		edit_inline(msg.message_id, "`Group Is Not Added`")
	else
	local text = '_Welcome To_ *Group Option*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Settings", callback_data="/settings:"..matches[2]}, 
			{text = "> MuteList", callback_data="/mutelist:"..matches[2]}
		},
		{
			{text = '> More ', callback_data = '/more:'..matches[2]}
		},
		{
			{text = '> About Us ', callback_data = '/beyond:'..matches[2]}
		},
		{
			{text= '> Exit' ,callback_data = '/exit:'..matches[2]}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/settings' then
	if data[tostring(matches[2])] then 	
		if data[tostring(matches[2])]["settings"]["num_msg_max"] then 	
			NUM_MSG_MAX = tostring(data[tostring(matches[2])]['settings']['num_msg_max'])
		else 	
			NUM_MSG_MAX = tostring(5)
		end
	end
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Group Owner")
	else
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/moresettings' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Group Owner")
	else
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/mutelist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Group Owner")
	else
		mutelists(msg, data, matches[2])
	end
end

          -- ####################### Settings ####################### --
		  
if matches[1] == '/locklink' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local locklink = data[tostring(matches[2])]["settings"]["lock_link"]
		if locklink == "no" then
			text = 'Link Has Been Locked'
			data[tostring(matches[2])]["settings"]["lock_link"] = "yes"
			save_data(_config.moderation.data, data)
		elseif locklink == "yes" then
			text = 'Link Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_link"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockedit' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local lockedit = data[tostring(matches[2])]["settings"]["lock_edit"]
		if lockedit == "no" then
			text = 'Edit Has Been Locked'
			data[tostring(matches[2])]["settings"]["lock_edit"] = "yes"
			save_data(_config.moderation.data, data)
		elseif lockedit == "yes" then
			text = 'Edit Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_edit"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/locktags' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_tag"]
		if chklock == "no" then
			text = 'Tags Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_tag"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Tags Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_tag"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockjoin' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_join"]
		if chklock == "no" then
			text = 'Join Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_join"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Join Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_join"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockflood' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["flood"]
		if chklock == "no" then
			text = 'Flood Has Been Locked'
            data[tostring(matches[2])]["settings"]["flood"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Flood Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["flood"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockspam' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_spam"]
		if chklock == "no" then
			text = 'Spam Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_spam"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Spam Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_spam"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmention' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_mention"]
		if chklock == "no" then
			text = 'Mention Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_mention"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Mention Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_mention"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockarabic' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_arabic"]
		if chklock == "no" then
			text = 'Arabic Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_arabic"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Arabic Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_arabic"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockwebpage' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_webpage"]
		if chklock == "no" then
			text = 'Webpage Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_webpage"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Webpage Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_webpage"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockmarkdown' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_markdown"]
		if chklock == "no" then
			text = 'Markdown Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_markdown"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Markdown Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_markdown"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockpin' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_pin"]
		if chklock == "no" then
			text = 'Pin Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_pin"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Pin Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_pin"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/lockbots' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_bots"]
		if chklock == "no" then
			text = 'Bots Has Been Locked'
            data[tostring(matches[2])]["settings"]["lock_bots"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Bots Has Been Unlocked'
			data[tostring(matches[2])]["settings"]["lock_bots"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/welcome' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chklock = data[tostring(matches[2])]["settings"]["welcome"]
		if chklock == "no" then
			text = 'Welcome Has Been Enable'
            data[tostring(matches[2])]["settings"]["welcome"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
			text = 'Welcome Has Been Disable'
			data[tostring(matches[2])]["settings"]["welcome"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/floodup' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local flood_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['num_msg_max'] then
				flood_max = data[tostring(matches[2])]['settings']['num_msg_max']
			end
		end
		if tonumber(flood_max) < 30 then
			flood_max = tonumber(flood_max) + 1
			data[tostring(matches[2])]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			text = "Flood Sensitivity Has Been Set To : "..flood_max
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/flooddown' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local flood_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['num_msg_max'] then
				flood_max = data[tostring(matches[2])]['settings']['num_msg_max']
			end
		end
		if tonumber(flood_max) > 2 then
			flood_max = tonumber(flood_max) - 1
			data[tostring(matches[2])]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			text = "Flood Sensitivity Has Been Set To : "..flood_max
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/charup' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local char_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['set_char'] then
				char_max = data[tostring(matches[2])]['settings']['set_char']
			end
		end
		if tonumber(char_max) < 1000 then
			char_max = tonumber(char_max) + 1
			data[tostring(matches[2])]['settings']['set_char'] = char_max
			save_data(_config.moderation.data, data)
			text = "Character Sensitivity Has Been Set To : "..char_max
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/chardown' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local char_max = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['set_char'] then
				char_max = data[tostring(matches[2])]['settings']['set_char']
			end
		end
		if tonumber(char_max) > 2 then
			char_max = tonumber(char_max) - 1
			data[tostring(matches[2])]['settings']['set_char'] = char_max
			save_data(_config.moderation.data, data)
			text = "Character Sensitivity Has Been Set To : "..char_max
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/floodtimeup' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local check_time = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['time_check'] then
				check_time = data[tostring(matches[2])]['settings']['time_check']
			end
		end
		if tonumber(check_time) < 10 then
			check_time = tonumber(check_time) + 1
			data[tostring(matches[2])]['settings']['time_check'] = check_time
			save_data(_config.moderation.data, data)
			text = "Flood Check Time Has Been Set To : "..check_time
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/floodtimedown' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local check_time = 5
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['time_check'] then
				check_time = data[tostring(matches[2])]['settings']['time_check']
			end
		end
		if tonumber(check_time) > 2 then
			check_time = tonumber(check_time) - 1
			data[tostring(matches[2])]['settings']['time_check'] = check_time
			save_data(_config.moderation.data, data)
			text = "Flood Check Time Has Been Set To : "..check_time
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end

			-- ###################### Mute ###################### --
			
if matches[1] == '/muteall' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_all"]
		if chkmute == "no" then
			text = 'All Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_all"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'All Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_all"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutegif' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_gif"]
		if chkmute == "no" then
			text = 'Gifs Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_gif"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Gifs Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_gif"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutetext' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_text"]
		if chkmute == "no" then
			text = 'Text Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_text"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Text Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_text"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteinline' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_inline"]
		if chkmute == "no" then
			text = 'Inline Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_inline"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Inline Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_inline"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutegame' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_game"]
		if chkmute == "no" then
			text = 'Game Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_game"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Game Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_game"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutephoto' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_photo"]
		if chkmute == "no" then
			text = 'Photo Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_photo"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Photo Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_photo"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevideo' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_video"]
		if chkmute == "no" then
			text = 'Video Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_video"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Video Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_video"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteaudio' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_audio"]
		if chkmute == "no" then
			text = 'Audio Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_audio"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Audio Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_audio"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutevoice' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_voice"]
		if chkmute == "no" then
			text = 'Voice Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_voice"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Voice Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_voice"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutesticker' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_sticker"]
		if chkmute == "no" then
			text = 'Sticker Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_sticker"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Sticker Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_sticker"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutecontact' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_contact"]
		if chkmute == "no" then
			text = 'Contact Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_contact"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Contact Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_contact"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/muteforward' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_forward"]
		if chkmute == "no" then
			text = 'Forward Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_forward"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Forward Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_forward"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutelocation' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_location"]
		if chkmute == "no" then
			text = 'Location Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_location"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Location Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_location"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutedocument' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_document"]
		if chkmute == "no" then
			text = 'Document Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_document"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Document Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_document"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutetgservice' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_tgservice"]
		if chkmute == "no" then
			text = 'TgService Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_tgservice"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'TgService Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_tgservice"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end
if matches[1] == '/mutekeyboard' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local chkmute = data[tostring(matches[2])]["mutes"]["mute_keyboard"]
		if chkmute == "no" then
			text = 'Keyboard Has Been Muted'
            data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chkmute == "yes" then
			text = 'Keyboard Has Been Unmuted'
			data[tostring(matches[2])]["mutes"]["mute_keyboard"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		mutelists(msg, data, matches[2])
	end
end

            -- ####################### More #######################--
			
if matches[1] == '/more' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local text = 'Welcome To More Option'
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> OwnerList", callback_data="/ownerlist:"..matches[2]},
				{text = "> ModList", callback_data="/modlist:"..matches[2]}
			},
			{
				{text = "> SillentList", callback_data="/silentlist:"..matches[2]},
				{text = "> FilterList", callback_data="/filterlist:"..matches[2]}
			},
			{
				{text = "> BanList", callback_data="/bans:"..matches[2]},
				{text = "> WhiteList", callback_data="/whitelist:"..matches[2]}
			},
			{
				{text = "> Group Link", callback_data="/link:"..matches[2]},
				{text = "> Group Rules", callback_data="/rules:"..matches[2]}
			},
			{ 
				{text = "> Back To Option", callback_data="/option:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/ownerlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local i = 1
		if next(data[tostring(matches[2])]['owners']) == nil then --fix way
			text = "_No_ *owner* _in this group_"
		else
			text = '*List of Group Owners :*\n'
			for k,v in pairs(data[tostring(matches[2])]['owners']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Demote All Owners", callback_data="/cleanowners:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanowners' then
	if not is_admin1(msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Bot Admin")
	else
		if next(data[tostring(matches[2])]['owners']) == nil then
			text = "_No_ *owners* _in this group_"
		else
			text = "_All_ *Group Owners* _Has Been_ *Demoted*"
			for k,v in pairs(data[tostring(matches[2])]['owners']) do
				data[tostring(matches[2])]['owners'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/ownerlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/filterlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		if next(data[tostring(matches[2])]['filterlist']) == nil then --fix way
			text = "*Filter List* _Is Empty_"
		else 
			local i = 1
			text = '*List Of Filtered Words List :*\n'
			for k,v in pairs(data[tostring(matches[2])]['filterlist']) do
				text = text..''..i..' - '..check_markdown(k)..'\n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Clean", callback_data="/cleanfilterlist:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanfilterlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		if next(data[tostring(matches[2])]['filterlist']) == nil then
			text = "*Filter List* _Is Empty_"
		else
			text = "*Filter List* _Has Been_ *Cleaned*"
			for k,v in pairs(data[tostring(matches[2])]['filterlist']) do
				data[tostring(matches[2])]['filterlist'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/filterlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/modlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local i = 1
		if next(data[tostring(matches[2])]['mods']) == nil then --fix way
			text = "_No_ *moderator* _in this group_"
		else
			text = '*List of Moderator :*\n'
			for k,v in pairs(data[tostring(matches[2])]['mods']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Demote All Moderators", callback_data="/cleanmods:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanmods' then
	if not is_owner1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Group Owner")
	else
		if next(data[tostring(matches[2])]['mods']) == nil then
			text = "_No_ *Moderator* _in this group_"
		else
			text = "_All_ *Moderators* _Has Been_ *Demoted*"
			for k,v in pairs(data[tostring(matches[2])]['mods']) do
				data[tostring(matches[2])]['mods'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/modlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/bans' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local i = 1
		if next(data[tostring(matches[2])]['banned']) == nil then --fix way
			text = "_No_ *banned users* _in this group_"
		else
			text = '*List of Banned Users :*\n'
			for k,v in pairs(data[tostring(matches[2])]['banned']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Unban All Banned Users", callback_data="/cleanbans:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/whitelist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
      if not data[tostring(matches[2])]['whitelist'] then
    data[tostring(matches[2])]['whitelist'] = {}
    save_data(_config.moderation.data, data)
		elseif next(data[tostring(matches[2])]['whitelist']) == nil then --fix way
			text = "*White List* _Is Empty_"
		else 
			local i = 1
			text = '*List Of White Users :*\n'
			for k,v in pairs(data[tostring(matches[2])]['whitelist']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Clean", callback_data="/cleanwhitelist:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanwhitelist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		if next(data[tostring(matches[2])]['whitelist']) == nil then
			text = "*White List* _Is Empty_"
		else
			text = "*White List* _Has Been_ *Cleaned*"
			for k,v in pairs(data[tostring(matches[2])]['whitelist']) do
				data[tostring(matches[2])]['whitelist'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/whitelist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/silentlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local i = 1
		if next(data[tostring(matches[2])]['is_silent_users']) == nil then --fix way
			text = "_No_ *silent users* _in this group_"
		else
			text = '*List of Silent Users :*\n'
			for k,v in pairs(data[tostring(matches[2])]['is_silent_users']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Unsilent All Silent Users", callback_data="/cleansilentlist:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleansilentlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		if next(data[tostring(matches[2])]['is_silent_users']) == nil then
			text = "_No_ *silent users* _in this group_"
		else
			text = "_All_ *Silent Users* _Has Been_ *Unsilent*"
			for k,v in pairs(data[tostring(matches[2])]['is_silent_users']) do
				data[tostring(matches[2])]['is_silent_users'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/silentlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanbans' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		if next(data[tostring(matches[2])]['banned']) == nil then
			text = "_No_ *banned users* _in this group_"
		else
			text = "_All_ *Banned Users* _Has Been_ *Unbanned*"
			for k,v in pairs(data[tostring(matches[2])]['banned']) do
				data[tostring(matches[2])]['banned'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/bans:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/link' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local linkgp = data[tostring(matches[2])]['settings']['linkgp']
		if not linkgp then
			text = "_First set a_ *link* _for group with using_ /setlink"
		else
			text = "[Group Link Is Here]("..linkgp..")"
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/rules' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local rules = data[tostring(matches[2])]['rules']
		if not rules then
			text = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@BeyondTeam"
		elseif rules then
			text = '*Group Rules :*\n'..rules
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Clean", callback_data="/cleanrules:"..matches[2]}
			},
			{ 
				{text = "> Back", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanrules' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Moderator")
	else
		local rules = data[tostring(matches[2])]['rules']
		if not rules then
			text = "`No Rules Available`"
		else
			text = "*Group Rules* _Has Been_ *Cleaned*"
			data[tostring(matches[2])]['rules'] = nil
			save_data(_config.moderation.data, data)
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "> Back", callback_data="/rules:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
         -- ####################### About Us ####################### --
if matches[1] == '/beyond' then
	local text = _config.info_text
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> SoLiD", callback_data="/solid:"..matches[2]}, 
			{text = "> ToOfan", callback_data="/toofan:"..matches[2]}
		},
		{
			{text = '> Our GitHub ', url = 'https://www.github.com/BeyondTeam'}
		},
		{
			{text= '> Back' ,callback_data = '/option:'..matches[2]}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
end

if matches[1] == '/solid' then
local text = [[*》SoLiD Information《*
_》Age :_ *26*
_》Name :_ *Saeid Rostami*
_》City :_ *Shahriar - Tehran*
*-------------------------*
*》GitHub :《*
》[SoLiD021](Github.Com/SoLiD021)
*-------------------------*
*》Bridges :《*
_》Pv : _[@SoLiD](Telegram.Me/SoLiD)
_》PvResan : _[@SoLiD Pv](Telegram.Me/SoLiD021Pv_Bot)
*-------------------------*
*》Expertise :《*
_》_*Lua*, *Cli* `and` *Api* _Bots_
*-------------------------*]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Back", callback_data="/beyond:"..matches[2]}
		}
	}
    edit_inline(msg.message_id, text, keyboard)
end
if matches[1] == '/toofan' then
local text = [[*》ToOfan Information《*
_》Age :_ *35*
_》Name :_ *Ali AzizAbadi*
_》City :_ *Bam - Kerman*
*-------------------------*
*》GitHub :《*
》[To0fan](GitHub.Com/To0fan)
*-------------------------*
*》Bridges :《*
_》Pv :_ [@ToOfan](Telegram.Me/ToOfan)
_》PvResan :_ [@ToOfanRobot](Telegram.Me/ToOfanRobot)
*-------------------------*
*》Expertise :《*
*》C#, Lua, VB.Net, JAVA*

*-------------------------*]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Back", callback_data="/beyond:"..matches[2]}
		}
	}
    edit_inline(msg.message_id, text, keyboard)
end
if matches[1] == '/exit' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "You Are Not Group Owner")
	else
		local text = '*Group Option Closed*'
		edit_inline(msg.message_id, text)
	end
end

end
--------------End Inline Query---------------
end

local function pre_process(msg)
print(serpent.block(msg), {comment=false})
--leave_group(msg.chat.id)
end

return {
	patterns ={
		"^-(%d+)$",
		"^###cb:(%d+)$",
		"^[/](sudolist)$",
		"^[/](setsudo)$",
		"^[/](remsudo)$",
		"^[/](setsudo) (%d+)$",
		"^[/](remsudo) (%d+)$",
		"^###cb:(/option):(.*)$",
		"^###cb:(/settings):(.*)$",
		"^###cb:(/mutelist):(.*)$",
		"^###cb:(/locklink):(.*)$",
		"^###cb:(/lockedit):(.*)$",
		"^###cb:(/locktags):(.*)$",
		"^###cb:(/lockjoin):(.*)$",
		"^###cb:(/lockpin):(.*)$",
		"^###cb:(/lockmarkdown):(.*)$",
		"^###cb:(/lockmention):(.*)$",
		"^###cb:(/lockarabic):(.*)$",
		"^###cb:(/lockwebpage):(.*)$",
		"^###cb:(/lockbots):(.*)$",
		"^###cb:(/lockspam):(.*)$",
		"^###cb:(/lockflood):(.*)$",
		"^###cb:(/welcome):(.*)$",
		"^###cb:(/muteall):(.*)$",
		"^###cb:(/mutegif):(.*)$",
		"^###cb:(/mutegame):(.*)$",
		"^###cb:(/mutevideo):(.*)$",
		"^###cb:(/mutevoice):(.*)$",
		"^###cb:(/muteinline):(.*)$",
		"^###cb:(/mutesticker):(.*)$",
		"^###cb:(/mutelocation):(.*)$",
		"^###cb:(/mutedocument):(.*)$",
		"^###cb:(/muteaudio):(.*)$",
		"^###cb:(/mutephoto):(.*)$",
		"^###cb:(/mutetext):(.*)$",
		"^###cb:(/mutetgservice):(.*)$",
		"^###cb:(/mutekeyboard):(.*)$",
		"^###cb:(/mutecontact):(.*)$",
		"^###cb:(/muteforward):(.*)$",
		"^###cb:(/toofan):(.*)$",
		"^###cb:(/setflood):(.*)$",
		"^###cb:(/floodup):(.*)$",
		"^###cb:(/flooddown):(.*)$",
		"^###cb:(/charup):(.*)$",
		"^###cb:(/chardown):(.*)$",
		"^###cb:(/floodtimeup):(.*)$",
		"^###cb:(/floodtimedown):(.*)$",
		"^###cb:(/moresettings):(.*)$",
		"^###cb:(/more):(.*)$",
		"^###cb:(/ownerlist):(.*)$",
		"^###cb:(/cleanowners):(.*)$",
		"^###cb:(/modlist):(.*)$",
		"^###cb:(/cleanmods):(.*)$",
		"^###cb:(/bans):(.*)$",
		"^###cb:(/beyond):(.*)$",
		"^###cb:(/cleanbans):(.*)$",
		"^###cb:(/filterlist):(.*)$",
		"^###cb:(/cleanfilterlist):(.*)$",
		"^###cb:(/whitelist):(.*)$",
		"^###cb:(/cleanwhitelist):(.*)$",
		"^###cb:(/silentlist):(.*)$",
		"^###cb:(/solid):(.*)$",
		"^###cb:(/cleansilentlist):(.*)$",
		"^###cb:(/link):(.*)$",
		"^###cb:(/rules):(.*)$",
		"^###cb:(/cleanrules):(.*)$",
		"^###cb:(/exit):(.*)$",

	},
	run=run,
	pre_process=pre_process
}
