_G.OPG = _G.OPG or {}
OPG.ModPath = ModPath
OPG.SaveFile = OPG.SaveFile or SavePath .. "OrPack_options.txt"
OPG.ModOptions = OPG.ModPath .. "menus/modoptions.txt"
OPG.settings = OPG.settings or {}

function OPG:Reset()
	self.settings = {
		max_progress = false,
		show_bodybags = false,
		show_accuracy = false,
		show_kills = false
	}
	self:Save()
end

function OPG:Load()
	local file = io.open(self.SaveFile, "r")
	if file then
		for key, value in pairs(json.decode(file:read("*all"))) do
			self.settings[key] = value
		end
		file:close()
	else
		self:Reset()
	end
end

function OPG:Save()
	local file = io.open(self.SaveFile, "w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

OPG:Load()

Hooks:Add("LocalizationManagerPostInit", "OrPack_loc", function(...)				
	LocalizationManager:add_localized_strings({
		menu_crimenet =								"Crime.NET",
		menu_crimenet_offline =						"Crime.NET Offline",
		menu_specialization =						"Perk",
		OP_credits_help = 							"Meet the Original Pack Crew",
		OP_credits = 								"Credits",
		menu_OP_discord_desc = 						"Join Original Pack Discord server",
		menu_OP_discord = 							"Discord",
		menu_OP_changelog =							"Changelog",
		menu_OP_changelog_desc =					"Changelog and update history.",
		menu_find_game =							"Find Game",
		menu_find_game_desc =						"Join to any lobby.",
		menu_max_progress =							"Max Progress",
		menu_max_progress_desc =					"Switch to the Maximum Progress mode.",
		menu_normal_progress =						"Normal Progress",
		menu_normal_progress_desc =					"Back to normal progress.",
		menu_max_progress_dialog_title =			"Switching to Max Progress Mode",
		menu_max_progress_dialog_message =			"Max Progress mode uses a different save file.\n\nSo everything that you gain in Normal Mode will be safe, you can come back any time.\nGame will restart on its own as soon as you confirm switching to Max Progress.\n\nDo you want switch to Max Progress Mode?",
		menu_normal_progress_dialog_title =			"Switching to Normal Progress",
		menu_normal_progress_dialog_message =		"Game will restart on its own as soon as you confirm switching to Normal Progress.\n\nDo you want switch to Normal Progress?",
		dialog_what_is_max_progress =				"What is Max Progress Mode?",
		dialog_what_is_max_progress_text =			"In Max Progress Mode you get all items, weapons, masks, materials, and etc. for free. One for each type of item. (Only those items that you have from DLC)\nMaximum Infamy rank and 100 level.\nThis mode uses a different save file, which allows you to switch between the max and normal modes without spoiling your progress and also has its own progress of achievements. But you can only play with those players who also have the Max Progress enabled.\n\nStarter money kit:\nOffshore Account - $1.000.000.000\nSpending cash - $150.000.000\nContinental coins - © 250.000\n\nDo you want switch to Max Progress Mode?",
		menu_always_show_body_bags_title =			"Show body bags counter",
		menu_always_show_accuracy_title =			"Show accuracy counter",
		menu_always_show_kills_title =				"Show kill counter",
		heist_arm =									"Armored Transport",
		menu_challenge_pink_panther_objective =		"On day 1 of the Framing Frame job, steal 9 sold paintings without being seen.",
		menu_silencer_radius_silent =				"Noise suppression: Silent",
		menu_silencer_radius_very_small =			"Noise suppression: Very High",
		menu_silencer_radius_small =				"Noise suppression: High",
		menu_silencer_radius_medium =				"Noise suppression: Medium",
		menu_silencer_radius_high =					"Noise suppression: Low",
		menu_silencer_radius_very_high =			"Noise suppression: Very Low",
		menu_asset_lock_additional_assets =			"Requires the ''Inside Man'' Skill to unlock",
		menu_asset_lock_buy_bodybags_asset =		"Requires the ''Cleaner'' Skill to unlock",
		menu_asset_lock_buy_spotter_asset =			"Requires the ''Spotter'' Skill to unlock",
		bm_menu_unlock_akimbo =						"Requires the Akimbo skill",
		bm_menu_unlock_gunzerker =					"Requires the Gunzerker skill",
		bm_menu_unlock_overpowered =				"Locked to reputation level 85",
		menu_offshore_remains =						"Offshore Remains",
		achievement_cac_15 =						"C-Forever",
		bm_wp_upg_bonus_team_exp_money_p3_desc =	"+5% Experience & money reward for you and your crew.",
		bm_menu_skill_locked_chico_injector =		"Requires the Uppers skill",
		bm_menu_skill_locked_pocket_ecm_jammer =	"Requires the ECM Feedback skill",
		loading_op_gameplay_title =					"Original Pack Tips",
		loading_op_trivia_title =					"Original Pack Trivia",
		loading_op_gameplay_1 =						"Events, Classics, and some other contracts can only be found in the Crime.NET pop-ups.",
		loading_op_gameplay_2 =						"Flashbangs don't flicker and beep before exploding, but you still can destroy them before they detonate.",
		loading_op_gameplay_3 =						"Medics only appear on Safehouse Raid and Holdout.",
		loading_op_gameplay_4 =						"Intimidated guards don't have to answer their pagers.",
		loading_op_gameplay_5 =						"The maximum amount of pagers you can respond to is 2, but it can be increased to 4 with a skill from the Mastermind tree.",
		loading_op_gameplay_6 =						"On Hard difficulty and below, you can respond to 4 pager calls without the pager skill.",
		loading_op_gameplay_7 =						"Sprinting in stealth causes noise in a small radius around you, which can alert nearby guards and civilians. The noise can be heard through walls and some ceilings.",
		loading_op_gameplay_8 =						"Even if your weapon has a silencer, it still makes some less or more noticable noise. It depends on which silencer you equip and the weapon itself.",
		loading_op_gameplay_9 =						"In stealth, intimidated civilians' markers disappear over time so you have to stay aware and stay in control. There are skills in the Mastermind tree to help you with hostage control.",
		loading_op_gameplay_10 =					"Amount of dominated enemies depends on the number of teammates that have the Dominator skill. Maximum amount is 4.",
		loading_op_gameplay_11 =					"You need a skill in the Technician tree in order to use your Trip Mines as Shaped Charges to open doors & safes.",
		loading_op_gameplay_12 =					"In some cases purchasing the contract is not the best idea, since it may not pay off. That's why it is better to wait for the wanted contract to pop-up in Crime.NET.",
		loading_op_gameplay_13 =					"Drills make noise which alert nearby bystanders in a 10m radius. The Technician has a skill to reduce it or make it silent completely.",
		loading_op_gameplay_14 =					"Certain Perks can improve gameplay during stealth, like allowing you to lockpick or interact with some objects while in Casing Mode.",
		loading_op_gameplay_15 =					"The value of your loot depends on two factors - Difficulty and Pay Grade. The maximum of both makes your PAYDAY higher.",
		loading_op_gameplay_16 =					"You can unlock Pocket ECP Jammers by getting a skill ECM Feddback ACED.",
		loading_op_gameplay_17 =					"Avoid fighting alone or in open areas, otherwise no one will be able to help you up.",
		loading_op_gameplay_18 =					"Use cover as often and as long as you can, the cops are commencing an assault against you, not the other way around.",
		loading_op_gameplay_19 =					"Perk point rate has been changed to 10,000:1. Meaning that if a contract gives less than 10,000 XP, no points will be granted.",
		loading_op_gameplay_20 =					"If you do not want to start from scratch, then there is an option named ''Max Progress'' in the Main Menu of the mod. But then you will be restricted to playing with players that also use the mode and use a seperate savefile.",
		loading_op_gameplay_21 =					"Mayhem difficulty becomes unlocked upon reaching Infamy V.",
		loading_op_gameplay_22 =					"Original Pack achievements are separated from the progress of Steam achievements.",
		loading_op_gameplay_23 =					"New Safehouse, Profiles, Continental coins, Crime Spree, and Holdout unlocks once you reach Infamy V.",
		loading_op_gameplay_24 =					"Sniper Rifle & Special Ammo penetration damage is reduced by 80% when shot through walls or Shields.",
		loading_op_gameplay_25 =					"Crime Spree game mode has unique difficulty - Death Sentence. You will encounter Zeal units that have increased damage and health. To fight them back, you need a great team and to gather all your strengths and tactics.",
		loading_op_gameplay_26 =					"A job can only be restarted if Stealth has been failed and before the assault has begun.",
		loading_op_gameplay_27 =					"You can purchase Event contracs every Friday 13 or October 31.",
		loading_op_gameplay_28 =					"You have a higher chance of surviving an assault wave if a teammate brings extra ammo.",
		loading_op_gameplay_29 =					"Weapons with Special Ammo Types like Explosive or Incendiary are more useful than Stock Ammo Type, but it makes Ammo Bags the only reliable way to replenish them.",
		loading_op_gameplay_30 =					"Before moving to a distant objective or an escape through an exposed area, make sure that your teammates have healed up and restocked on ammo.",
		loading_op_gameplay_31 =					"Enemies can be intimidated during assault breaks without the Dominator skill.",
		loading_op_gameplay_32 =					"Whenever you kill a civilian, you lose experience. You get a 1% deduction for each kill, 2% on OVERKILL, and 3% on Death Wish difficulty.",
		loading_op_gameplay_33 =					"Laser module can disturb civilians and guards. Flashlights are ignored, since each guard has his own and they're not considered abnormal.",
		loading_op_gameplay_34 =					"Have no crew to play with? You can check out link to the Discord server of Original Pack to find a teammates to play.",
		loading_op_gameplay_35 =					"Check out the Original Pack's Changelog in the main menu, it's a safe bet that you will find some new info about the mod and features have been added into the game.",
		loading_op_gameplay_36 =					"Some Contracts offer different Pay Grade every day.",
		loading_op_gameplay_37 =					"Enforcers can easily suppress the enemy to protect their teammates from enemy fire. Suppressed enemies cancel their current objective, have their accuracy worsened or might consider avoiding you entirely.",
		loading_op_gameplay_38 =					"Consider doing Stealth, even partially. It can help you gain a head start even if it ends up having to finish the heist loud.",
		loading_op_gameplay_39 =					"Taking hostages will cause the police to delay their next assault.",
		loading_op_gameplay_40 =					"You can purchase Classic Heists by playing during PAYDAY 2 and PAYDAY: The Heist release dates.",
		loading_op_gameplay_41 =					"Breaking regular cameras may cause guards to investigate them.",
		loading_op_gameplay_42 =					"Return fire towards the enemy when moving across open areas, you may not hit or kill them but they will be much less accurate and allow you to safely get to your destination.",
		loading_op_gameplay_43 =					"Taking too much damage or getting downed during an assault break might cause the police to start an assault early.",
		loading_op_gameplay_44 =					"Accuracy is rewarding.",
		loading_op_gameplay_45 =					"Undertaking a high Pay Grade contract with low Player Reputation may not grant a lot of Experience.",
		loading_op_gameplay_46 =					"Death Wish introduces Cloaker Squads which spawn as a part of the assault wave, stay together and never leave anyone behind.",
		loading_op_gameplay_47 =					"Flashbangs can be heard when thrown by cops. Face away or try to destroy it before it detonates.",
		loading_op_gameplay_48 =					"Perks are reset when gaining Infamy.",
		loading_op_gameplay_49 =					"Special Weapons are unlocked by gaining 85 Reputation Level.",
		loading_op_gameplay_50 =					"On difficulties above OVERKILL, nearby Guards and Civilians can hear and be alerted by a Heister's voice during stealth.",
		loading_op_gameplay_51 =					"A Spotter and Spycams can highlight Special Enemies during loud approach.",
		loading_op_gameplay_52 =					"Technicians can greatly improve Drills, but they can also perform area denial, long-range support and help against Special Enemies with their Sensor Mines.",
		loading_op_gameplay_53 =					"A Drill with the appropriate upgrade will attempt to restart itself shortly after being broken, but only once. If it doesn't restart itself, a Heister will have to repair it.",
		loading_op_gameplay_54 =					"A Mastermind can aid the entire team with slight bonuses, Insider access to certain Assets, Inspire or Weapon Recoil reduction.",
		loading_op_gameplay_55 =					"Inspiring a teammate speeds up their interaction speed.",
		loading_op_gameplay_56 =					"SWAT Turrets are weak to explosives.",
		loading_op_gameplay_57 =					"ECMs cause SWAT Turrets to attack fellow Police Force members instead of Heisters for as long as its active.",
		loading_op_gameplay_58 =					"The Fugitive can be supplementary for other skilltrees, but can also become its own role in the team if enough skillpoints are invested.",
		loading_op_gameplay_59 =					"A Ghost is the master of Stealth but also the master of Close-Quarters Combat and covertly doing objectives while the team distracts enemies.",
		loading_op_gameplay_60 =					"Mr. Wise Guy does stack.",
		loading_op_gameplay_61 =					"Gage Package rewards are cycled daily.",
		loading_op_gameplay_62 =					"Play safe, take your time. Don't be afraid to retreat somewhere else to defend in when things are becoming difficult.",
		loading_op_gameplay_63 =					"The cops will constantly try to sabotage your objectives (Computers, Drills, Lootbags) if you leave them unattended.",
		loading_op_gameplay_64 =					"Collecting enough loose loot can give slight XP bonuses.",
		loading_op_gameplay_65 =					"Every weapon has its own use, don't be afraid to experiment.",
		loading_op_gameplay_66 =					"Always search for a defensible location to retreat to in case if you get overwhelmed by the cops.",
		loading_op_gameplay_67 =					"Explosives have a large radius.",
		loading_op_gameplay_68 =					"Having players fulfill different roles in the team is better than having everyone try to do a little bit of everything at same time.",
		loading_op_gameplay_69 =					"Sometimes the obvious approach to an objective is not the best move.",
		loading_op_gameplay_70 =					"Provide Covering Fire to distract enemies while a teammate is being revived.",
		loading_op_gameplay_71 =					"ECM Feedback works through walls.",
		loading_op_gameplay_72 =					"Stray bullets during stealth can alert guards and civilians near the bullet impact on Mayhem and Death Sentence difficulties.",
		loading_op_gameplay_73 =					"If you're playing a heist which prevents you from returning to certain areas, make sure that everyone has used the deployed Medic and Ammo bags before moving on.",
		loading_op_gameplay_74 =					"Mayhem and Death Sentence difficulties becomes unlocked upon reaching Reputation level 95 or Infamy 1.",
		loading_op_gameplay_75 =					"Death Wish is unlocked upon reaching level 80.",
		loading_op_gameplay_76 =					"When wearing lighter armor on higher difficulties, you need to be more careful and pick your fights accordingly. Your teammates can protect you with their heavier armor, while you can carry loot faster than them.",
		loading_op_gameplay_77 =					"Consider remaining in Casing Mode during stealth, you will be able to go anywhere to check things for teammates, mark guards, use Sixth-Sense in better positions or utilize your Perks.",
		loading_op_gameplay_78 =					"Don't deploy all of your equipment in one spot as you would end up without resources if you'd get cornered somewhere else.",
		loading_op_trivia_1 =						"Nothing special happened in 2015 and 2016.",
		menu_prof_mod_contract =					"If you fail, the entire contract will be terminated.",
		menu_prof_mod_hostage =						"The amount of hostages is unknown during the assault.",
		menu_prof_mod_flash =						"Flashbang thrown by the enemy have no delay.",
		menu_prof_mod_inventory =					"Special equipment is not transferred if the player is taken into custody.",
		menu_achievements_teamwork_players_2_to_4 =	"2-4 Players",
		menu_cn_legend_hidden =						"##Hidden## Contracts",
		menu_cn_legend_hate =						"Hate level",
		menu_holiday_exp_bonus =					"Holiday bonus",
		menu_killed_civs_reduction_exp =			"Killed civilians penalty",
		menu_loose_money_collected_exp =			"Loose money found",
		menu_one_down_additional =					"Current wave:",
		menu_one_down_additional_2 =				"Experience increased by",
		menu_killed_civs =							"Civilians were killed! Experience reduced by ",
		menu_collected_packages =					"Gage packages found. Experience increased by ",
		menu_loose_money =							"Loose money found. Experience increased by ",
		cn_menu_contract_day =						"$stages day",
		menu_OP_title =								"Original Pack",
	})
		
	if Idstring("russian"):key() == SystemInfo:language():key() then
		LocalizationManager:add_localized_strings({
			menu_crimenet_offline =							"Crime.NET Оффлайн",
			menu_specialization =							"Перк",
			OP_credits_help = 								"Познакомтесь с командой Original Pack",
			OP_credits = 									"Титры",
			menu_OP_discord_desc = 							"Присоединяйтесь к Дискорд серверу Original Pack",
			menu_OP_discord = 								"Дискорд",
			menu_OP_changelog =								"Изменения",
			menu_OP_changelog_desc =						"Список изменений и версии которые выходили ранее.",
			menu_find_game =								"Найти игру",
			menu_find_game_desc =							"Присоединится к любому лобби.",
			menu_max_progress =								"Максимальный прогресс",
			menu_max_progress_desc =						"Переключение на максимальный прогресс, у вас будет все чего вы хотите для игры. Что-то вроде творческого режима.",
			menu_max_progress_dialog_title =				"Переключение на максимальный прогресс",
			menu_max_progress_dialog_message =				"В режиме Максимального прогресса используется другой файл сохранения.\n\nТо есть все что вы успели наиграть в обычном режиме сохранится, вы в любой момент сможете вернутся назад и продолжить с теми ресурсами которые вы успели заработать.\nИгра перезапустится самостоятельно как только вы подтвердите переход на Максимальный прогресс.\n\nВы хотите перейти в режим Максимального прогресса?",
			menu_normal_progress =							"Обычный прогресс",
			menu_normal_progress_desc =						"Вернутся назад в обычный режим.",
			menu_normal_progress_dialog_title =				"Переключение на обычный прогресс",
			menu_normal_progress_dialog_message =			"Игра перезапустится самостоятельно как только вы подтвердите переход на обычный прогресс.\n\nВы хотите перейти в обычный прогресс?",
			dialog_what_is_max_progress =					"Что такое Максимальный прогресс?",
			dialog_what_is_max_progress_text =				"Максимальный прогресс - это режим, в котором открыты все игровые предметы, оружие, маски, материалы и тд.\nВсё по одному экземпляру (Только те предметы, из DLC которых вы имеете).\nТак же вы будете максимального ранга Дурной репутации и 100 уровня.\nЭтот режим использует другой файл сохранения, что позваляет переключатся между максимальным и обычным режимами без вреда прогрессу и так же имеет свой прогресс достижений. Но играть вы сможете только с теми игроками у кого также включен Максимальный прогресс.\n\nНачальные средства:\nОфшорный счет - $1.000.000.000\nНаличные - $150.000.000\nКонтиненталь монеты - ©250.000\n\nВы хотите перейти в Максимальный прогресс?",
			menu_always_show_body_bags_title =				"Показывать мешки для трупов",
			menu_always_show_accuracy_title =				"Показывать счетчик точности",
			menu_always_show_kills_title =					"Показывать счетчик убийств",
			heist_arm =										"Транспорт",
			menu_challenge_pink_panther_objective =			"Завершите первый день контракта ''Подстава с картинами'', украв 9 картин, не поднимая тревогу.",
			menu_silencer_radius_silent =					"Подавление шума: Бесшумно",
			menu_silencer_radius_very_small =				"Подавление шума: Очень большое",
			menu_silencer_radius_small =					"Подавление шума: Большое",
			menu_silencer_radius_medium =					"Подавление шума: Среднее",
			menu_silencer_radius_high =						"Подавление шума: Слабое",
			menu_silencer_radius_very_high =				"Подавление шума: Очень слабое",
			menu_asset_lock_additional_assets =				"Требуется навык ''Свой человек''",
			menu_asset_lock_buy_bodybags_asset =			"Требуется навык ''Чистильщик''",
			menu_asset_lock_buy_spotter_asset =				"Требуется навык ''Наблюдатель''",
			bm_menu_unlock_akimbo =							"Требуется навык ''Акимбо''",
			bm_menu_unlock_gunzerker =						"Требуется навык ''Шизострел''",
			bm_menu_unlock_overpowered =					"Заблокировано до уровня репутации 85",
			menu_offshore_remains =							"Офшорный счет",
			bm_wp_upg_bonus_team_exp_money_p3_desc =		"+5% опыта и денег для вас и вашей команды",
			bm_menu_skill_locked_chico_injector =			"Требуется навык ''Колеса''",
			bm_menu_skill_locked_pocket_ecm_jammer =		"Требуется навык ''Акустическая петля''",
			loading_op_gameplay_title =						"Советы Original Pack",
			loading_op_trivia_title =						"Прочее о Original Pack",
			loading_op_gameplay_1 =							"''События'', ''Классческие'' и некоторые другие контракты выпадают только в Crime.NET. Их невозможно купить в брокере контрактов.", 
			loading_op_gameplay_2 =							"Светошумовые гранаты не мигают и издают звука перед взрывом, но их всё еще можно найти и сломать.",
			loading_op_gameplay_3 =							"Медиков можно встретить только на Защите убежища или Противостоянии.",
			loading_op_gameplay_4 =							"Во время стелса задоминированые охранники не требуют ответа на пейджер.",
			loading_op_gameplay_5 =							"Максимум можно ответить на 4 пейджера, без навыка на 2. Если вы ответили на 2 пейджера, то товарщи у которых нет навыка больше не смогут ответить на пейджер, иначе поднимится тревога.",
			loading_op_gameplay_6 =							"Если сложность контракта ''Сложно'' или ниже, то вы можете отвечать на максимальное количество пейджеров без необходимых на это навыков.",
			loading_op_gameplay_7 =							"Когда вы бежите, то в радиусе 2 метров вас могут услышать. Если вы стреляете из оружия с глушителем, то пулю которая ударилась в стену или землю могут услышать в радиусе 1 метра.",
			loading_op_gameplay_8 =							"Даже если ваше оружие с глушителем, оно все равно издает шум. Это зависит от того, какой глушитель установлен и самого оружия.",
			loading_op_gameplay_9 =							"У гражданских, которых вы запугали со временем исчезает индикатор. Так что будьте на чеку. Так же есть навык который заранее указывает, что гражданский встал и скоро будет звонить полиции или убегать.",
			loading_op_gameplay_10 =						"Количество задоминированых врагов зависит от количества товарищей в команде с навыком ''Доминатор'' вплоть до 4.",
			loading_op_gameplay_11 =						"Если вам нужно открыть сейф или дверь с помощью С4, то вам необходим определенный навык в ветке Техника.",
			loading_op_gameplay_12 =						"В большинстве случаев покупка контрактов не окупается его прохождением. Так что в некоторых случаях лучше подождать выпадения лучшего контракта в Crime.NET.",
			loading_op_gameplay_13 =						"Дрель издает шум в радиусе 10 метров, который может потревожить мимо стоящих гражданских и охранников. Навыки в древе Техника могут уменьшить шум.",
			loading_op_gameplay_14 =						"В игре есть перки, которые улучшают возможности в режиме исследования. Например: вы можете взамывать замки, подбирать предметы, взаимодействовать с компьютерами не надевая маски.",
			loading_op_gameplay_15 =						"Ценность сумок зависит от двух факотов - сложности контракта и уровня оплаты. Чем выше эти два фактора, тем больше цена за сумки.",
			loading_op_gameplay_16 =						"Вы можете разблокировать Карманные Генераторы Помех открытием навыка Акустическая Петля ПРО.",
			loading_op_gameplay_17 =						"Если ваш напарник упал, то убедитесь что он лежит не на открытой местности. Иначе пытаясь поднять его подстрелят и вас, тогда придется поднимать вас обоих.",
			loading_op_gameplay_18 =						"Не стеснятесь пользоватся укрытиями столько времени, сколько необходимо. Даже если придется сидеть полчаса.",
			loading_op_gameplay_19 =						"Получение очков перков идет по курсу 10.000 к 1. Если контракт дает меньше 10.000 опыта, то очки начислятся не будут.",
			loading_op_gameplay_20 =						"Если вы не хотите играть с нуля, то специально для вас в меню есть опция ''Максимальный прогресс''. Но играть вы сможете только с такими же игроками у кого включен максимальный прогресс.",
			loading_op_gameplay_21 =						"Максимальная сложность до 5й Дурной репутации - ''Жажда Смерти''. После вам будет доступны ''Хаос'' и при достижении 20 ранга ''Серии Преступлений'' вам будет доступен ''Смертный приговор''. Найти их можно только в Crime.NET.",
			loading_op_gameplay_22 =						"Достижения в Original Pack не идут в прогресс достижений Steam.",
			loading_op_gameplay_23 =						"Новое убежище, Профили навыков, монеты Континенталь, Серия Преступлений и Противостояние - всё это открывается с 5го уровня Дурной Репутации.",
			loading_op_gameplay_24 =						"Если вы стреляете сковзь стены или щиты, то урон снижается на 80%.",
			loading_op_gameplay_25 =						"В режиме ''Серия преступлений'' установлена уникальная сложность игры - ''Смертный приговор''. Вас встретят юниты ''Zeal'', у которых повышенные урон и здоровье. Чтобы дать им отпор, вам необходимо собрать все свои силы и навыки.",
			loading_op_gameplay_26 =						"Рестарт доступен только после провала тихого прохождения и только до того как начнется первый штурм.",
			loading_op_gameplay_27 =						"Контракты от ''События'' можно приобрести каждую пятницу 13-е или октябрь 31-го.",
			loading_op_gameplay_28 =						"Если вы собираетесь на громкое ограбление без патронов, то выживаемость вашей команды снизится до 75-50%.",
			loading_op_gameplay_29 =						"Оружие со взрывными и зажигательными снарядами полезнее обычных, но боезапас восполняется только из сумок с патронами.",
			loading_op_gameplay_30 =						"Если побег доступен и вы собираетесь скрытся, удостоверьтесь что вся команда восполнила своё здоровье. Иначе кто-то из вас сможет недобежать до побега.",
			loading_op_gameplay_31 =						"Когда штурм закончился, враги могут сдатся даже если у вас нет навыка ''Доминатор''. Полезно когда в округе нет гражданских, которых можно связать.",
			loading_op_gameplay_32 =						"При убийстве гражданского вы теряете опыт. За каждого убитого снимается 1%, на уровне сложности OVERKILL - 2%, а на Жажде Смерти - 3%.",
			loading_op_gameplay_33 =						"Лазерные целеуказатели могут потревожить гражданских и охранников. Фонарики игнорируются, так как каждый охранник имеет свой фонарь и не вызывает подозрения нежели лазерные целеуказатели.",
			loading_op_gameplay_34 =						"Не с кем играть? Загляните в Дискорд сервер по ссылке в главном меню.",
			loading_op_gameplay_35 =						"Посмотрите Original Pack Изменения нажав кнопку в главном меню, уверен вы найдете там больше полезной информации о старых обновлениях которые добавили элементы которые могут быть полезными при прохождении.",
			loading_op_gameplay_36 =						"У некоторых контрактов уровень оплаты меняется каждый день.",
			loading_op_gameplay_37 =						"Штурмовики могут с легкостью подавлять врагов, предоставляя защиту своим напарникам. Подавленные враги будут забывать про свое текущие задачи, хуже стрелять или вовсе постараются вас избежать.",
			loading_op_gameplay_38 =						"Пробуйте действовать скрытно. Это позволит вам выполнить часть заданий, даже если в конечном итоге ограбление придется завершать громко.",
			loading_op_gameplay_39 =						"Полиция будет тратить больше времени на подготовку к штурму, если у вас есть заложники.",
			loading_op_gameplay_40 =						"Если вы будете играть в дни выхода PAYDAY 2 и PAYDAY: The Heist, то сможете приобрести Классические контракты.",
			loading_op_gameplay_41 =						"Уничтожение обычных камер заставляет охранников их проверять.",
			loading_op_gameplay_42 =						"Отстреливайтесь от врагов, когда пересекаете открытые пространства. Даже если вы не попадете, то запугаете их и понизите их точность стрельбы. Это позволит безопаснее пройти этот участок.",
			loading_op_gameplay_43 =						"Если вы будете получать много урона или падать во время перерывов, то полиция начнет штурм раньше.",
			loading_op_gameplay_44 =						"Точная стрельба - один из залогов успеха.",
			loading_op_gameplay_45 =						"Если у вас низкий уровень репутации, то контракт с высоким уровнем оплаты может дать мало опыта.",
			loading_op_gameplay_46 =						"На уровне сложности Жажда Смерти и выше, вам будут встречаться Отряды Клокеров. Держитесь вместе и никого не оставляйте позади.",
			loading_op_gameplay_47 =						"Вы можете услышать, когда полицейские бросают светошумовые гранаты. Отвернитесь или уничтожьте ее до того, как она взорвется.",
			loading_op_gameplay_48 =						"Перки тоже сбрасываются при получении уровня Бесславия.",
			loading_op_gameplay_49 =						"Особое Оружие открывается при получении 85-ого Уровня Репутации.",
			loading_op_gameplay_50 =						"На уровнях сложности выше OVERKILL охранники и гражданские могут услышать речь грабителей при скрытном прохождении.",
			loading_op_gameplay_51 =						"Наблюдатель и Камеры-шпионы будут помечать Особых Врагов при громокм прохождении.",
			loading_op_gameplay_52 =						"Техник может значительно улучшать дрели, а также блокировать проходы, предоставлять поддержку на расстоянии и помогать в борьбе с Особыми Врагами при помощи своих Мин-сенсоров.",
			loading_op_gameplay_53 =						"При наличии соответствующего навыка дрель попытается починиться сама после поломки, однако только один раз. Если дрель не починилась, то это придется делать одному из грабителей.",
			loading_op_gameplay_54 =						"Манипулятор может помогать всей команде небольшими бонусами, доступом к услугам своего человека, Вдохновением и уменьшением отдачи оружия.",
			loading_op_gameplay_55 =						"Вдохновение увеличивает скорость взаимодействия напарника.",
			loading_op_gameplay_56 =						"Турели уязвимы к взырвчатке.",
			loading_op_gameplay_57 =						"Пока работает Генератор Помех турель будет атаковать полицейских, а не грабителей.",
			loading_op_gameplay_58 =						"Древо навыков Беглец может использоваться в дополнение к другим древам, но может и быть собственной ролью, если вложить достаточное количество очков навыков.",
			loading_op_gameplay_59 =						"Призрак - мастер скрытности. Однако, он также крайне способен в ближнем бою и может скрытно выполнять задания, пока его команда отвлекает врагов во время громкого прохождения.",
			loading_op_gameplay_60 =						"Перк Мистер Умник складывается.",
			loading_op_gameplay_61 =						"Награды за посылки Гейджа меняются каждый день.",
			loading_op_gameplay_62 =						"Играйте осторожно и не торопитесь. Не стесняйтесь отступать в безопасное место, если ситуация выходит из под контроля.",
			loading_op_gameplay_63 =						"Полицейские будут пытаться помешать вам выполнять задачи: останавливать взлом компьютеров, ломать дрели и воровать сумки. Постарайтесь следить за своими целями.",
			loading_op_gameplay_64 =						"Сбор достаточного количества мелкой добычи даст небольшой бонус к опыту.",
			loading_op_gameplay_65 =						"Каждое оружие имеет свое применение. Не бойтесь экспериментировать.",
			loading_op_gameplay_66 =						"Всегда ищите надежное место, в которое вы сможете укрыться в случае турдной ситуации.",
			loading_op_gameplay_67 =						"Взырвчатка имеет большой радиус взрыва.",
			loading_op_gameplay_68 =						"Лучше иметь разделенные роли в команде, чем когда каждый будет пытаться делать все понемногу.",
			loading_op_gameplay_69 =						"Самый очевидный подход не всегда самый лучший.",
			loading_op_gameplay_70 =						"Во время того, как вашего напарника поднимают, старайтесь отвлекать врагов огнем.",
			loading_op_gameplay_71 =						"Акустическая петля работает через стены.",
			loading_op_gameplay_72 =						"Пули ударившись от любой обьект издают шум и могут потревожить гражданских и охранников. на сложностях Хаос и Смертный приговор.",
			loading_op_gameplay_73 =						"Если вы играете в ограблении, которое не позволяет вам вернуться в определенные зоны, убедитесь, что все воспользовались разложенными аптечками и сумками с патронами, прежде чем двигаться дальше.",
			loading_op_gameplay_74 =						"Хаос и Смертный приговор открываются на уровне 95 или ранге Бесславия 1.",
			loading_op_gameplay_75 =						"Жажда смерти открывается на уровне 80.",
			loading_op_gameplay_76 =						"Надевая более легкую броню на более высоких уровнях сложности, вам нужно быть более осторожным и соответственно выбирать свои бои. Ваши товарищи по команде могут защитить вас своей более тяжелой броней, в то время как вы можете переносить добычу быстрее, чем они.",
			loading_op_gameplay_77 =						"Подумайте о том, чтобы оставаться в режиме наблюдения во время скрытности, вы сможете пойти куда угодно, чтобы проверить положение товарищей по команде, отметить охранников, использовать шестое чувство в более выгодных позициях или воспользоваться своими привилегиями.",
			loading_op_gameplay_78 =						"Не размещайте все свое снаряжение в одном месте, так как в конечном итоге вы останетесь без ресурсов, если вас загонят в угол где-нибудь в другом месте.",
			loading_op_trivia_1 =							"В 2015 и 2016 годах ничего особенного не произошло.",
			menu_prof_mod_contract =						"В случае неудачи контракт будет отменен.",
			menu_prof_mod_hostage =							"Количество заложников неизвестно во время штурма.",
			menu_prof_mod_flash =							"Cветошумовые гранаты, брошенные противником, не имеют задержки.",
			menu_prof_mod_inventory =						"Особое снаряжение не передается если игрок попал под стражу.",	
			menu_achievements_teamwork_players_2_to_4 =		"2-4 Игроков",
			menu_cn_legend_hidden =							"##Скрытые## контракты",
			menu_cn_legend_hate =							"Уровень ненависти",
			menu_holiday_exp_bonus =						"Праздничные дни",
			menu_killed_civs_reduction_exp =				"Штраф убийства гражданских",
			menu_loose_money_collected_exp =				"Найдена мелкая добыча",
			menu_one_down_additional =						"Текущая волна:",
			menu_one_down_additional_2 =					"Количество очков опыта увеличено на",
			menu_killed_civs =								"Убиты гражданские! Количество очков опыта снижено на ",
			menu_collected_packages =						"Найдены посылки Гейджа. Количество очков опыта увеличено на ",
			menu_loose_money =								"Найдена мелкая добыча. Количество очков опыта увеличено на ",
			cn_menu_contract_length_header =				"Длительность:",
			cn_menu_contract_day =							"$stages День",
			cn_menu_contract_length =						"$stages Дня",
			cn_menu_community =								"Сообщество",
			cn_menu_pro_job =								"PRO JOB",
			menu_es_next_level =							"Следующий уровень:",
		})
	end
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "OPGOptions", function(menu_manager, nodes)
	if OPG.settings.max_progress then
		SavefileManager.PROGRESS_SLOT = 69
		SavefileManager.BACKUP_SLOT = 69
		MenuNodeMainGui.version = MenuNodeMainGui.version .. " (Max Progress Mode)"
	end
	
	MenuCallbackHandler.OPG_menu_show_bodybags_callback = function(self, item)
		OPG.settings.show_bodybags = item:value() == "on" and true or false
		OPG:Save()
	end
	
	MenuHelper:AddToggle({
		id = "OPG_menu_show_bodybags_callback",
		title = "menu_always_show_body_bags_title",
		callback = "OPG_menu_show_bodybags_callback",
		value = OPG.settings.show_bodybags,
		menu_id = "OP_interface",  
	})
	
	MenuCallbackHandler.OPG_menu_show_accuracy_callback = function(self, item)
		OPG.settings.show_accuracy = item:value() == "on" and true or false
		OPG:Save()
	end
	
	MenuHelper:AddToggle({
		id = "OPG_menu_show_accuracy_callback",
		title = "menu_always_show_accuracy_title",
		callback = "OPG_menu_show_accuracy_callback",
		value = OPG.settings.show_accuracy,
		menu_id = "OP_interface",  
	})
	
	MenuCallbackHandler.OPG_menu_show_kills_callback = function(self, item)
		OPG.settings.show_kills = item:value() == "on" and true or false
		OPG:Save()
	end
	
	MenuHelper:AddToggle({
		id = "OPG_menu_show_kills_callback",
		title = "menu_always_show_kills_title",
		callback = "OPG_menu_show_kills_callback",
		value = OPG.settings.show_kills,
		menu_id = "OP_interface",  
	})
end)

Hooks:Add("MenuManagerSetupCustomMenus", "OPGOptions", function(menu_manager, nodes)
	MenuHelper:NewMenu("OP_options")
	MenuHelper:NewMenu("OP_interface")
end)

Hooks:Add("MenuManagerBuildCustomMenus", "OPGOptions", function(menu_manager, nodes)
	nodes["OP_options"] = MenuHelper:BuildMenu("OP_options")
	nodes["OP_interface"] = MenuHelper:BuildMenu("OP_interface")

	local function menu_node(menu_item, name, clbk, pos, item_name)
		local menu_item = menu_item
		local data = {type = "CoreMenuItem.Item"}
		local params = {
			name = "menu_"..name.."_btn",
			text_id = "menu_"..name,
			help_id = "menu_"..name.."_desc",
			callback = clbk
		}
		local new_item = menu_item:create_item(data, params)
		new_item.dirty_callback = callback(menu_item, menu_item, "item_dirty")
		if menu_item.callback_handler then
			new_item:set_callback_handler(menu_item.callback_handler)
		end
		local position = pos
		for index, item in pairs(menu_item._items) do
			if item:name() == item_name then
				position = index
				break
			end
		end
		table.insert(menu_item._items, position, new_item)
	end
	
	MenuCallbackHandler.OP_changelog_callback = function(self, item)
		Steam:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=2062176985")
	end
	
	if OPG.settings.Dev then
		MenuCallbackHandler.test_mode_enable_callback = function(self, item) end
		MenuCallbackHandler.test_mode_callback = function(self, item)
			local blank = ""
			local menu_options = {
				[1] = {
					text = managers.localization:text("dialog_yes"),
					callback = MenuCallbackHandler.test_mode_enable_callback,
				},
				[2] = {
					text = managers.localization:text("dialog_no"),
					is_cancel_button = true,
				},
			}
			local menu = QuickMenu:new(blank, blank, menu_options)
			menu:Show()
		end
		menu_node(nodes["OP_options"], "test_mode", "test_mode_callback", 4, "")
	end
	
	MenuCallbackHandler.max_progress_enable_callback = function(self, item)
		if OPG.settings.max_progress then
			OPG.settings.max_progress = false
			OPG:Save()
		elseif not OPG.settings.max_progress then
			OPG.settings.max_progress = true
			OPG:Save()
		end

		os.execute("start steam://rungameid/218620")
		os.exit()
	end
	MenuCallbackHandler.what_is_max_progress_callback = function(self, item)
		local dialog_data = {
			focus_button = 1,
			title = "",
			text = "dialog_what_is_max_progress_text",
			texture = false
		}
		local yes_button = {
			text = managers.localization:text("dialog_yes"),
			callback_func = MenuCallbackHandler.max_progress_enable_callback
		}
		local no_button = {
			text = managers.localization:text("dialog_no")
		}
		dialog_data.button_list = {
			yes_button,
			no_button
		}
		dialog_data.video = "movies/lootdrop" .. math.random(8)
		dialog_data.video_loop = true
		managers.menu:show_video_message_dialog(dialog_data)
	end
	MenuCallbackHandler.max_progress_callback = function(self, item)
		local menu_title = OPG.settings.max_progress and managers.localization:text("menu_normal_progress_dialog_title") or managers.localization:text("menu_max_progress_dialog_title") 
		local menu_message = OPG.settings.max_progress and managers.localization:text("menu_normal_progress_dialog_message") or managers.localization:text("menu_max_progress_dialog_message")
		local menu_options = {
			[1] = {
				text = managers.localization:text("dialog_yes"),
				callback = MenuCallbackHandler.max_progress_enable_callback,
			},
			[2] = {
				text = managers.localization:text("dialog_no"),
				is_cancel_button = true,
			},
		}
		if not OPG.settings.max_progress then
			menu_options[3] = {}
			menu_options[4] = {
				text = managers.localization:text("dialog_what_is_max_progress"),
				callback = MenuCallbackHandler.what_is_max_progress_callback,
			}
		end
		local menu = QuickMenu:new( menu_title, menu_message, menu_options )
		menu:Show()
	end

	local progress = OPG.settings.max_progress and "normal_progress" or "max_progress"
	
	MenuHelper:AddMenuItem(nodes["OP_options"], "OP_interface", "menu_user_interface", "", 1)
	menu_node(nodes["OP_options"], "OP_changelog", "OP_changelog_callback", 1, "options")
	menu_node(nodes["OP_options"], progress, "max_progress_callback", 3, "options")
	MenuCallbackHandler.OP_discord_callback = function(self, item)
		Steam:overlay_activate("url", "https://discord.com/invite/sEEbE95")
	end
	menu_node(nodes["OP_options"], "OP_discord", "OP_discord_callback", 1, "")
end)