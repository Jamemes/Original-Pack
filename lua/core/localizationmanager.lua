_G.OriginalPackOptions = _G.OriginalPackOptions or {}
OriginalPackOptions.ModPath = ModPath
OriginalPackOptions.SaveFile = OriginalPackOptions.SaveFile or SavePath .. "OriginalPackOptions.txt"
OriginalPackOptions.ModOptions = OriginalPackOptions.ModPath .. "menus/modoptions.txt"
OriginalPackOptions.settings = OriginalPackOptions.settings or {}

function OriginalPackOptions:Reset()
	self.settings = {
		Spooky = true,
		Enable_Max_Progress = false,
		Enable_Test = false,
		Anlways_Show_Body_Bags = false,
		Anlways_Show_Accuracy = false,
		Anlways_Show_Kills = false
	}
	self:Save()
end

function OriginalPackOptions:Load()
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

function OriginalPackOptions:Save()
	local file = io.open(self.SaveFile, "w+")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

OriginalPackOptions:Load()

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
		menu_max_progress_desc =					"Switch to maximum progress, you will have everything you want for play. Some kind of Creative mode.",
		menu_normal_progress =						"Normal Progress",
		menu_normal_progress_desc =					"Back to normal progress.",
		menu_max_progress_dialog_title =			"Switching to Max Progress Mode",
		menu_max_progress_dialog_message =			"Max Progress mode using a different save file.\n\nSo everything that you gain in normal mode will be saved, you can come back any time and continue with the resources that you earned earlier.\nGame will restart on its own as soon as you confirm switching to Max Progress.\n\nDo you want switch to Max Progress Mode?",
		menu_normal_progress_dialog_title =			"Switching to Normal Progress",
		menu_normal_progress_dialog_message =		"Game will restart on its own as soon as you confirm switching to Normal Progress.\n\nDo you want switch to Normal Progress?",
		dialog_what_is_max_progress =				"What does Max Progress Mode?",
		dialog_what_is_max_progress_text =			"Maximum progress is a mode where you get all items, weapons, masks, materials, and etc. One for each type of item. (Only those items that you have from DLC)\nMaximum Infamy rank and 100 level.\nThis mode uses a different save file, which allows you to switch between the max and normal modes without spoiling your progress and also has its own progress of achievements. But you can only play with those players who also have the Max Progress enabled.\n\nStarter money kit:\nOffshore Account - $1.000.000.000\nSpending cash - $150.000.000\nContinental coins - © 250.000\n\nDo you want switch to Max Progress Mode?",
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
		loading_op_gameplay_1 =						"Events, Classics, and some other contracts can only be found in the Crime.NET pop-ups. Meaning, you can't buy them from the contract broker.",
		loading_op_gameplay_2 =						"Flashbangs don't flicker and beep before exploding, but you still can destroy them before they detonate.",
		loading_op_gameplay_3 =						"You can only find medics on Safehouse Raid or Holdout.",
		loading_op_gameplay_4 =						"Intimidated guard does not require a response to their pager.",
		loading_op_gameplay_5 =						"The maximum amount of pagers that can be answered is 4, without the skill it's 2. If you have already answered 2 pagers, teammates who don't have the skill will no longer be able to answer any pagers, otherwise the alarm will be tripped.",
		loading_op_gameplay_6 =						"On Hard difficulty and below, you can respond to the maximum amount of pagers without the necessary skill.",
		loading_op_gameplay_7 =						"While you sprint, your footsteps can be heard within a 2m radius. If you have fired your gun with a silencer, the bullet can still be heard within a 1m radius once it hits the wall or ground.",
		loading_op_gameplay_8 =						"Even if your weapon has a silencer, it still makes some less or more noticable noise. It's depends on what silencer is attached and the weapon itself.",
		loading_op_gameplay_9 =						"Intimidated civilians' marker disappears over time. So watch out. Control Freak skill in Mastermind skill tree will indicate when a civilian is about to get up and call the police or run away.",
		loading_op_gameplay_10 =					"Amount of dominated enemies depends on the number of teammates with the Dominator skill. Maximum amount is 4.",
		loading_op_gameplay_11 =					"If you want to open a safe or door using C4, you need a certain skill in the Technician tree.",
		loading_op_gameplay_12 =					"In some cases purchasing the contract is not the best idea, since it may not pay off. That's why it is better to wait for the wanted contract to pop-up in Crime.NET.",
		loading_op_gameplay_13 =					"The drill makes a noise within a 10m radius, which can disturb bystanders. Skill in the Technician tree can greatly reduce or even muffle the noise.",
		loading_op_gameplay_14 =					"Certain perks can improve the quality of life in casing mode. E.g. you can pick locks, pick up items, and interact with computers without putting on the mask.",
		loading_op_gameplay_15 =					"Loot bags value depends on two factors - Difficulty and Pay Grade. The maximum of both makes your PAYDAY higher.",
		loading_op_gameplay_16 =					"ECM jammers do not disable the cameras (unless Casual Mode is active) but create interference that reduces the speed of detection. You can disable the camera only by looping them.",
		loading_op_gameplay_17 =					"If your teammate has been downed, make sure that he is not lying in an open area. Otherwise, you will end up being shot while trying to get him up, leaving both of you awating help from the rest of the team.",
		loading_op_gameplay_18 =					"Don't hesitate to use the cover as long as it is necessary. Even if you have to sit for half an hour.",
		loading_op_gameplay_19 =					"Perk points granting rate is 10,000 to 1. If the contract gives less than 10,000 experience, then point will not be awarded.",
		loading_op_gameplay_20 =					"If you do not want to start from the scratch, then there is an option named ''Max Progress'' in main menu. The flaw of doing so is being limited to playing with people who also use this mode.",
		loading_op_gameplay_21 =					"In standard game mode before you reach 5th Infamy, Death Wish is the maximum difficulty. After reaching you will be able to find in Crime.NET two more difficulties - Mayhem, and after reaching 20th Crime Spree rank you can find - Death Sentence.",
		loading_op_gameplay_22 =					"Original Pack achievements are separated from the progress of Steam achievements.",
		loading_op_gameplay_23 =					"New Safehouse, Profiles, Continental coins, Crime Spree, and Holdout unlocks once you reach Infamy V.",
		loading_op_gameplay_24 =					"If you shoot through the wall or shield, your damage will be redused by 80%.",
		loading_op_gameplay_25 =					"Crime Spree game mode has unique difficulty - Death Sentence. You will encounter Zeal units, that have increased damage and health. To fight them back, you need a great team and to gather all your strength and skills.",
		loading_op_gameplay_26 =					"You can restart the job only if you failed the Stealth and before the first assault will start.",
		loading_op_gameplay_27 =					"You can purchase Event contracs every Friday 13 or October 31.",
		loading_op_gameplay_28 =					"If you going loud without ammunition, your team is much less likely to fight off the assault.",
		loading_op_gameplay_29 =					"Weapons with explosive and incendiary ammo are more useful than stock weapons, but since they use special ammunition, ammo bags are the only way to get refill the reserve.",
		loading_op_gameplay_30 =					"If the escape is available and you are going for it, make sure the entire team has replenished their health. Otherwise, some of you may not survive the getaway.",
		loading_op_gameplay_31 =					"When the assault ends, you can intimidate enemies even if you don't have the Dominator skill. It's especially useful when there aren't any civilians in the area to take, or if you're out of ties",
		loading_op_gameplay_32 =					"Whenever you kill a civilian, you lose experience. You get a 1% deduction for each kill, 2% on OVERKILL, and 3% on Death Wish difficulty.",
		loading_op_gameplay_33 =					"Laser module can disturb civilians and guards. Flashlights are ignored, since each guard has his own and they're not considered abnormal.",
		loading_op_gameplay_34 =					"Have no crew to play with? You can check out link to the Discord server of Original Pack to find a teammates to play.",
		loading_op_gameplay_35 =					"Check out the Original Pack's Changelog in the main menu, it's a safe bet that you will find some new info about the mod and features have been added into the game.",
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
		menu_spooky_text =							"You've been spooked by spooky creep. Boo!",
		menu_spooky_yes =							"Uh, OK",
		menu_spooky_no =							"Not spooky enough",
		cn_menu_contract_day =						"$stages day",
		menu_OP_title =								"Original Pack",
		menu_test_mode =							"",
		menu_test_mode_desc =						"Test Mode",
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
			loading_op_gameplay_16 =						"Генератор помех не отключает камеру, а создает помехи которые уменьшают скорость подозрения. Отключить камеру можно только зацикливанием.",
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
			menu_spooky_text =								"Вы были напуганы ужасным существом. Бу!",
			menu_spooky_yes =								"Хм, ну ОК",
			menu_spooky_no =								"Недостаточно жутко",
			cn_menu_community =								"Сообщество",
			cn_menu_pro_job =								"PRO JOB",
			menu_es_next_level =							"Следующий уровень:",
		})
	end
end)

Hooks:Add("MenuManagerPopulateCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
	if OriginalPackOptions.settings.Enable_Test then
		SavefileManager.PROGRESS_SLOT = 25
		SavefileManager.BACKUP_SLOT = 25
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version .. "_test_mode"
		MenuNodeMainGui.version = "Version " .. tweak_data.version .. "  TEST MODE  " .. tweak_data.testing_text
	elseif OriginalPackOptions.settings.Enable_Max_Progress then
		SavefileManager.PROGRESS_SLOT = 69
		SavefileManager.BACKUP_SLOT = 69
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "Classic_Pack_" .. tweak_data.version .. "_max_mode"
		MenuNodeMainGui.version = "Version " .. tweak_data.version .. "  MAX PROGRESS MODE"
	end
	
	if OriginalPackOptions.settings.Enable_Max_Progress then
		tweak_data.narrative.contacts.classic.name_id = "heist_contact_classic"
		tweak_data.narrative.contacts.classic.hidden = false
		tweak_data.narrative.contacts.events.hidden = false
		tweak_data.narrative.jobs.kenaz.contact = "the_dentist"
		tweak_data.narrative.jobs.rat.contact = "bain"
		tweak_data.narrative.jobs.gallery.contact = "bain"
		tweak_data.narrative.jobs.arm_for.contact = "bain"
		tweak_data.narrative.jobs.arm_fac.contact = "bain"
		tweak_data.narrative.jobs.arm_par.contact = "bain"
		tweak_data.narrative.jobs.arm_hcm.contact = "bain"
		tweak_data.narrative.jobs.arm_und.contact = "bain"
		tweak_data.narrative.jobs.arm_cro.contact = "bain"
		tweak_data.narrative.jobs.branchbank_deposit.contact = "bain"
		tweak_data.narrative.jobs.branchbank_cash.contact = "bain"
		tweak_data.narrative.jobs.branchbank_gold_prof.contact = "bain"
		tweak_data.narrative.jobs.branchbank_prof.contact = "bain"
		tweak_data.narrative.jobs.kosugi_pro.contact = "bain"
	end
	
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Body_Bags_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Body_Bags = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Body_Bags_callback",
		title = "menu_always_show_body_bags_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Body_Bags_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Body_Bags,
		menu_id = "OP_interface",  
	})
	
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Accuracy_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Accuracy = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Accuracy_callback",
		title = "menu_anlways_show_accuracy_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Accuracy_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Accuracy,
		menu_id = "OP_interface",  
	})
	
	MenuCallbackHandler.OriginalPackOptions_menu_Anlways_Show_Kills_callback = function(self, item)
		OriginalPackOptions.settings.Anlways_Show_Kills = item:value() == "on" and true or false
		OriginalPackOptions:Save()
	end
	MenuHelper:AddToggle({
		id = "OriginalPackOptions_menu_Anlways_Show_Kills_callback",
		title = "menu_anlways_show_kills_title",
		callback = "OriginalPackOptions_menu_Anlways_Show_Kills_callback",
		value = OriginalPackOptions.settings.Anlways_Show_Kills,
		menu_id = "OP_interface",  
	})
end)

Hooks:Add("MenuManagerSetupCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
	MenuHelper:NewMenu("OP_options")
	MenuHelper:NewMenu("OP_interface")
end)

Hooks:Add("MenuManagerBuildCustomMenus", "OriginalPackOptionsOptions", function(menu_manager, nodes)
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
	
	if OriginalPackOptions.settings.Dev then
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
		if OriginalPackOptions.settings.Enable_Max_Progress then
			OriginalPackOptions.settings.Enable_Max_Progress = false
			OriginalPackOptions:Save()
		elseif not OriginalPackOptions.settings.Enable_Max_Progress then
			OriginalPackOptions.settings.Enable_Max_Progress = true
			OriginalPackOptions:Save()
		end
		if not OriginalPackOptions.settings.Enable_Test then
			os.execute("start steam://rungameid/218620")
			os.exit()
		end
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
		local menu_title = OriginalPackOptions.settings.Enable_Max_Progress and managers.localization:text("menu_normal_progress_dialog_title") or managers.localization:text("menu_max_progress_dialog_title") 
		local menu_message = OriginalPackOptions.settings.Enable_Max_Progress and managers.localization:text("menu_normal_progress_dialog_message") or managers.localization:text("menu_max_progress_dialog_message")
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
		if not OriginalPackOptions.settings.Enable_Max_Progress then
			menu_options[3] = {}
			menu_options[4] = {
				text = managers.localization:text("dialog_what_is_max_progress"),
				callback = MenuCallbackHandler.what_is_max_progress_callback,
			}
		end
		local menu = QuickMenu:new( menu_title, menu_message, menu_options )
		menu:Show()
	end

	local progress = OriginalPackOptions.settings.Enable_Max_Progress and "normal_progress" or "max_progress"
	
	MenuHelper:AddMenuItem(nodes["OP_options"], "OP_interface", "menu_user_interface", "", 1)
	menu_node(nodes["OP_options"], "OP_changelog", "OP_changelog_callback", 1, "options")
	menu_node(nodes["OP_options"], progress, "max_progress_callback", 3, "options")
	MenuCallbackHandler.OP_discord_callback = function(self, item)
		Steam:overlay_activate("url", "https://discord.com/invite/sEEbE95")
	end
	menu_node(nodes["OP_options"], "OP_discord", "OP_discord_callback", 1, "")
end)
