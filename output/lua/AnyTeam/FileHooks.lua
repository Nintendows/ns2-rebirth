
ModLoader.SetupFileHook( "lua/Server.lua", "lua/AnyTeam/Server.lua", "post" )

--- CORE CHANGES
ModLoader.SetupFileHook( "lua/Mixins/BaseModelMixin.lua", "lua/AnyTeam/Mixins/BaseModelMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/Mixins/CameraHolderMixin.lua", "lua/AnyTeam/Mixins/CameraHolderMixin.lua", "post" )

-- NS2+ fixes
ModLoader.SetupFileHook( "lua/NS2Plus/Client/CHUD_Outlines.lua", "lua/AnyTeam/NS2Plus/CHUD_Disabled.lua", "replace" )
ModLoader.SetupFileHook( "lua/NS2Plus/Client/CHUD_GoldenMode.lua", "lua/AnyTeam/NS2Plus/CHUD_Disabled.lua", "replace" ) -- wtf is this??
--ModLoader.SetupFileHook( "lua/NS2Plus/GUIScripts/GUIAlienHUD.lua", "lua/AnyTeam/NS2Plus/CHUD_Disabled.lua", "replace" )
--ModLoader.SetupFileHook( "lua/NS2Plus/Client/CHUDGUI_EndStats.lua", "lua/AnyTeam/NS2Plus/CHUDGUI_EndStats.lua", "replace" )

-- GAMEPLAY CHANGES
ModLoader.SetupFileHook( "lua/Balance.lua", "lua/AnyTeam/Balance.lua", "post" )
ModLoader.SetupFileHook( "lua/BalanceMisc.lua", "lua/AnyTeam/BalanceMisc.lua", "post" )
ModLoader.SetupFileHook( "lua/PowerPoint.lua", "lua/AnyTeam/PowerPoint.lua", "post" )
ModLoader.SetupFileHook( "lua/Exo.lua", "lua/AnyTeam/Exo.lua", "post" )
ModLoader.SetupFileHook( "lua/Exosuit.lua", "lua/AnyTeam/Exosuit.lua", "post" )

-- generic fixes
ModLoader.SetupFileHook( "lua/Globals.lua", "lua/AnyTeam/Globals.lua", "post" )
ModLoader.SetupFileHook( "lua/PlayingTeam.lua", "lua/AnyTeam/PlayingTeam.lua", "post" )
ModLoader.SetupFileHook( "lua/Shared.lua", "lua/AnyTeam/Shared.lua", "post" )
ModLoader.SetupFileHook( "lua/Utility.lua", "lua/AnyTeam/Utility.lua", "post" )
ModLoader.SetupFileHook( "lua/NS2Gamerules.lua", "lua/AnyTeam/NS2Gamerules.lua", "post" )
ModLoader.SetupFileHook( "lua/NS2Utility.lua", "lua/AnyTeam/NS2Utility.lua", "post" )
ModLoader.SetupFileHook( "lua/NS2Utility_Server.lua", "lua/AnyTeam/NS2Utility_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/ConstructMixin.lua", "lua/AnyTeam/ConstructMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/WeldableMixin.lua", "lua/AnyTeam/WeldableMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/MapBlip.lua", "lua/AnyTeam/MapBlip.lua", "post" )
ModLoader.SetupFileHook( "lua/JetpackOnBack.lua", "lua/AnyTeam/JetpackOnBack.lua", "post" )
ModLoader.SetupFileHook( "lua/SentryBattery.lua", "lua/AnyTeam/SentryBattery.lua", "post" )
ModLoader.SetupFileHook( "lua/Sentry.lua", "lua/AnyTeam/Sentry.lua", "post" )
ModLoader.SetupFileHook( "lua/Skulk.lua", "lua/AnyTeam/Skulk.lua", "post" )
ModLoader.SetupFileHook( "lua/Gorge.lua", "lua/AnyTeam/Gorge.lua", "post" )
ModLoader.SetupFileHook( "lua/Lerk.lua", "lua/AnyTeam/Lerk.lua", "post" )
ModLoader.SetupFileHook( "lua/TechTree_Server.lua", "lua/AnyTeam/TechTree_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/MarineOutlineMixin.lua", "lua/AnyTeam/MarineOutlineMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/EquipmentOutline.lua", "lua/AnyTeam/EquipmentOutline.lua", "post" )
ModLoader.SetupFileHook( "lua/MarineSpectator.lua", "lua/AnyTeam/MarineSpectator.lua", "post" )
ModLoader.SetupFileHook( "lua/CommanderGlowMixin.lua", "lua/AnyTeam/CommanderGlowMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/MarineTeam.lua", "lua/AnyTeam/MarineTeam.lua", "post" )
ModLoader.SetupFileHook( "lua/Player_Client.lua", "lua/AnyTeam/Player_Client.lua", "post" )
ModLoader.SetupFileHook( "lua/Alien.lua", "lua/AnyTeam/Alien.lua", "post" )
ModLoader.SetupFileHook( "lua/Harvester.lua", "lua/AnyTeam/Harvester.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Weapon.lua", "lua/AnyTeam/Weapons/Weapon.lua", "post" )
ModLoader.SetupFileHook( "lua/ReadyRoomTeam.lua", "lua/AnyTeam/ReadyRoomTeam.lua", "post" )
ModLoader.SetupFileHook( "lua/Marine.lua", "lua/AnyTeam/Marine.lua", "post" )
ModLoader.SetupFileHook( "lua/Marine_Client.lua", "lua/AnyTeam/Marine_Client.lua", "post" )
ModLoader.SetupFileHook( "lua/SensorBlip.lua", "lua/AnyTeam/SensorBlip.lua", "post" )
ModLoader.SetupFileHook( "lua/Order.lua", "lua/AnyTeam/Order.lua", "post" )
ModLoader.SetupFileHook( "lua/MinimapMappableMixin.lua", "lua/AnyTeam/MinimapMappableMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/AlienCommander.lua", "lua/AnyTeam/AlienCommander.lua", "post" )
ModLoader.SetupFileHook( "lua/Cyst_Server.lua", "lua/AnyTeam/Cyst_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/Commander.lua", "lua/AnyTeam/Commander.lua", "post" )
ModLoader.SetupFileHook( "lua/Commander_Client.lua", "lua/AnyTeam/Commander_Client.lua", "post" )
ModLoader.SetupFileHook( "lua/Commander_Server.lua", "lua/AnyTeam/Commander_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/Commander_Buttons.lua", "lua/AnyTeam/Commander_Buttons.lua", "post" )
ModLoader.SetupFileHook( "lua/CommandStation_Server.lua", "lua/AnyTeam/CommandStation_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/CommandStructure_Server.lua", "lua/AnyTeam/CommandStructure_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/NS2ConsoleCommands_Server.lua", "lua/AnyTeam/NS2ConsoleCommands_Server.lua", "post" )
ModLoader.SetupFileHook( "lua/NetworkMessages.lua", "lua/AnyTeam/NetworkMessages.lua", "post" )
ModLoader.SetupFileHook( "lua/NetworkMessages_Client.lua", "lua/AnyTeam/NetworkMessages_Client.lua", "post" )
ModLoader.SetupFileHook( "lua/NetworkMessages_Predict.lua", "lua/AnyTeam/NetworkMessages_Predict.lua", "post" )
ModLoader.SetupFileHook( "lua/RailgunTargetMixin.lua", "lua/AnyTeam/RailgunTargetMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/CommAbilities/Marine/Scan.lua", "lua/AnyTeam/CommAbilities/Marine/Scan.lua", "post" )
ModLoader.SetupFileHook( "lua/CommAbilities/Marine/EMPBlast.lua", "lua/AnyTeam/CommAbilities/Marine/EMPBlast.lua", "post" )
ModLoader.SetupFileHook( "lua/ServerAdminCommands.lua", "lua/AnyTeam/ServerAdminCommands.lua", "post" )
ModLoader.SetupFileHook( "lua/AlienTeamInfo.lua", "lua/AnyTeam/AlienTeamInfo.lua", "post" )
ModLoader.SetupFileHook( "lua/GUISensorBlips.lua", "lua/AnyTeam/GUISensorBlips.lua", "post" )
ModLoader.SetupFileHook( "lua/Armory.lua", "lua/AnyTeam/Armory.lua", "post" )
ModLoader.SetupFileHook( "lua/CommandStation.lua", "lua/AnyTeam/CommandStation.lua", "post" )
ModLoader.SetupFileHook( "lua/Extractor.lua", "lua/AnyTeam/Extractor.lua", "post" )
ModLoader.SetupFileHook( "lua/ARC.lua", "lua/AnyTeam/ARC.lua", "post" )
ModLoader.SetupFileHook( "lua/Observatory.lua", "lua/AnyTeam/Observatory.lua", "post" )
ModLoader.SetupFileHook( "lua/Onos.lua", "lua/AnyTeam/Onos.lua", "post" )
ModLoader.SetupFileHook( "lua/Entity.lua", "lua/AnyTeam/Entity.lua", "post" )
ModLoader.SetupFileHook( "lua/Player.lua", "lua/AnyTeam/Player.lua", "post" )
ModLoader.SetupFileHook( "lua/WallMovementMixin.lua", "lua/AnyTeam/WallMovementMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/DropPack.lua", "lua/AnyTeam/DropPack.lua", "post" )
ModLoader.SetupFileHook( "lua/SelectableMixin.lua", "lua/AnyTeam/SelectableMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/AchievementGiverMixin.lua", "lua/AnyTeam/AchievementGiverMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/ServerSponitor.lua", "lua/AnyTeam/ServerSponitor.lua", "post" )
--ModLoader.SetupFileHook( "lua/GUISelectionPanel.lua", "lua/AnyTeam/GUISelectionPanel.lua", "post" )
ModLoader.SetupFileHook( "lua/Infestation.lua", "lua/AnyTeam/Infestation.lua", "post" )

-- relevancymask fixes
ModLoader.SetupFileHook( "lua/Cyst.lua", "lua/AnyTeam/Cyst.lua", "post" )
ModLoader.SetupFileHook( "lua/CystUtility.lua", "lua/AnyTeam/CystUtility.lua", "post" )
ModLoader.SetupFileHook( "lua/Hive.lua", "lua/AnyTeam/Hive.lua", "post" )
ModLoader.SetupFileHook( "lua/Drifter.lua", "lua/AnyTeam/Drifter.lua", "post" )
ModLoader.SetupFileHook( "lua/EvolutionChamber.lua", "lua/AnyTeam/EvolutionChamber.lua", "post" )
ModLoader.SetupFileHook( "lua/Babbler.lua", "lua/AnyTeam/Babbler.lua", "post" )


-- bot fixes now in the Rebirth Bots mod
--[[
ModLoader.SetupFileHook( "lua/TeamJoin.lua", "lua/AnyTeam/TeamJoin.lua", "post" )

ModLoader.SetupFileHook( "lua/VotingAddCommanderBots.lua", "lua/AnyTeam/VotingAddCommanderBots.lua", "post" )

ModLoader.SetupFileHook( "lua/bots/PlayerBot.lua", "lua/AnyTeam/bots/PlayerBot.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/PlayerBrain.lua", "lua/AnyTeam/bots/PlayerBrain.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/MarineBrain.lua", "lua/AnyTeam/bots/MarineBrain.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/CommanderBrain.lua", "lua/AnyTeam/bots/CommanderBrain.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/Bot.lua", "lua/AnyTeam/bots/Bot.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/CommonActions.lua", "lua/AnyTeam/bots/CommonActions.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/BotMotion.lua", "lua/AnyTeam/bots/BotMotion.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/PlayerBot.lua", "lua/AnyTeam/bots/PlayerBot.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/BotAim.lua", "lua/AnyTeam/bots/BotAim.lua", "post" )
ModLoader.SetupFileHook( "lua/bots/BotUtils.lua", "lua/AnyTeam/bots/BotUtils.lua", "post" )

-- bot REPLACEMENTS
ModLoader.SetupFileHook( "lua/bots/MarineCommanderBrain_Data.lua", "lua/AnyTeam/bots/MarineCommanderBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/AlienCommanderBrain_Data.lua", "lua/AnyTeam/bots/AlienCommanderBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/TeamBrain.lua", "lua/AnyTeam/bots/TeamBrain.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/CommanderBot.lua", "lua/AnyTeam/bots/CommanderBot.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/FadeBrain_Data.lua", "lua/AnyTeam/bots/FadeBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/GorgeBrain_Data.lua", "lua/AnyTeam/bots/GorgeBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/LerkBrain_Data.lua", "lua/AnyTeam/bots/LerkBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/MarineBrain_Data.lua", "lua/AnyTeam/bots/MarineBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/OnosBrain_Data.lua", "lua/AnyTeam/bots/OnosBrain_Data.lua", "replace" )
ModLoader.SetupFileHook( "lua/bots/SkulkBrain_Data.lua", "lua/AnyTeam/bots/SkulkBrain_Data.lua", "replace" )
]]--

-- GUI fixes
ModLoader.SetupFileHook( "lua/GUIProduction.lua", "lua/AnyTeam/GUIProduction.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIHiveStatus.lua", "lua/AnyTeam/GUIHiveStatus.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIAlienHUD.lua", "lua/AnyTeam/GUIAlienHUD.lua", "post" )
ModLoader.SetupFileHook( "lua/Alien_Client.lua", "lua/AnyTeam/Alien_Client.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIAuraDisplay.lua", "lua/AnyTeam/GUIAuraDisplay.lua", "post" )
ModLoader.SetupFileHook( "lua/PowerUtility.lua", "lua/AnyTeam/PowerUtility.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIDeathScreen.lua", "lua/AnyTeam/GUIDeathScreen.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIMinimapConnection.lua", "lua/AnyTeam/GUIMinimapConnection.lua", "post" )
-- this is just to change the color (it's in a bad spot)
ModLoader.SetupFileHook( "lua/Insight.lua", "lua/AnyTeam/Insight.lua", "post" )

-- additional info for bots on first person spectate (needs netvars)
--ModLoader.SetupFileHook( "lua/GUIFirstPersonSpectate.lua", "lua/AnyTeam/GUIFirstPersonSpectate.lua", "post" )

-- weapons
ModLoader.SetupFileHook( "lua/Weapons/Alien/Ability.lua", "lua/AnyTeam/Weapons/Alien/Ability.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/BiteLeap.lua", "lua/AnyTeam/Weapons/Alien/BiteLeap.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/Spit.lua", "lua/AnyTeam/Weapons/Alien/Spit.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/SpitSpray.lua", "lua/AnyTeam/Weapons/Alien/SpitSpray.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/SpikesMixin.lua", "lua/AnyTeam/Weapons/Alien/SpikesMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/Web.lua", "lua/AnyTeam/Weapons/Alien/Web.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Marine/Welder.lua", "lua/AnyTeam/Weapons/Marine/Welder.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Marine/Railgun.lua", "lua/AnyTeam/Weapons/Marine/Railgun.lua", "post" )
ModLoader.SetupFileHook( "lua/Weapons/Marine/PulseGrenade.lua", "lua/AnyTeam/Weapons/Marine/PulseGrenade.lua", "post" )

-- needed for target fixes
ModLoader.SetupFileHook( "lua/Whip.lua", "lua/AnyTeam/Whip.lua", "post" )
ModLoader.SetupFileHook( "lua/Whip_Server.lua", "lua/AnyTeam/Whip_Server.lua", "post" )

-- outline fixes
ModLoader.SetupFileHook( "lua/HiveVision.lua", "lua/AnyTeam/HiveVision.lua", "post" )
ModLoader.SetupFileHook( "lua/HiveVisionMixin.lua", "lua/AnyTeam/HiveVisionMixin.lua", "post" )
ModLoader.SetupFileHook( "lua/CloakableMixin.lua", "lua/AnyTeam/CloakableMixin.lua", "post" )




-- REPLACEMENTS
-- TRY NOT TO HAVE TOO MANY
-- big pain if there is an update
ModLoader.SetupFileHook( "lua/TargetCache.lua", "lua/AnyTeam/TargetCache.lua", "replace" )
ModLoader.SetupFileHook( "lua/AlienStructure.lua", "lua/AnyTeam/AlienStructure.lua", "replace" )
ModLoader.SetupFileHook( "lua/VoiceOver.lua", "lua/AnyTeam/VoiceOver.lua", "replace" )
ModLoader.SetupFileHook( "lua/DamageTypes.lua", "lua/AnyTeam/DamageTypes.lua", "replace" )
ModLoader.SetupFileHook( "lua/DetectableMixin.lua", "lua/AnyTeam/DetectableMixin.lua", "replace" )

-- this replacement is literally just for the infestation change
ModLoader.SetupFileHook( "lua/BuildUtility.lua", "lua/AnyTeam/BuildUtility.lua", "replace" )

-- disabled for now
--ModLoader.SetupFileHook( "lua/LOSMixin.lua", "lua/AnyTeam/LOSMixin.lua", "replace" )

ModLoader.SetupFileHook( "lua/TeamMixin.lua", "lua/AnyTeam/TeamMixin.lua", "replace" )
ModLoader.SetupFileHook( "lua/MAC.lua", "lua/AnyTeam/MAC.lua", "replace" )
ModLoader.SetupFileHook( "lua/OrdersMixin.lua", "lua/AnyTeam/OrdersMixin.lua", "replace" )
ModLoader.SetupFileHook( "lua/Weapons/DotMarker.lua", "lua/AnyTeam/Weapons/DotMarker.lua", "replace" )
ModLoader.SetupFileHook( "lua/TeamMessenger.lua", "lua/AnyTeam/TeamMessenger.lua", "replace" )
ModLoader.SetupFileHook( "lua/GhostStructureMixin.lua", "lua/AnyTeam/GhostStructureMixin.lua", "replace" )
ModLoader.SetupFileHook( "lua/PhysicsGroups.lua", "lua/AnyTeam/PhysicsGroups.lua", "replace" )
ModLoader.SetupFileHook( "lua/Weapons/Alien/BileBomb.lua", "lua/AnyTeam/Weapons/Alien/BileBomb.lua", "replace" )
ModLoader.SetupFileHook( "lua/Chat.lua", "lua/AnyTeam/Chat.lua", "replace" )

-- UI stuff is horrible for filehooking. About 100 times easier to just replace!!
-- if you have a suggestion on how to not replace these without introducing bugs, let me know...
ModLoader.SetupFileHook( "lua/Hud/Marine/GUIExoHUD.lua", "lua/AnyTeam/Hud/Marine/GUIExoHUD.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIMinimap.lua", "lua/AnyTeam/GUIMinimap.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIWaypoints.lua", "lua/AnyTeam/GUIWaypoints.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIUnitStatus.lua", "lua/AnyTeam/GUIUnitStatus.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUICommanderLogout.lua", "lua/AnyTeam/GUICommanderLogout.lua", "replace" )
ModLoader.SetupFileHook( "lua/Hud/Commander/CystGhostModel.lua", "lua/AnyTeam/Hud/Commander/CystGhostModel.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIScoreboard.lua", "lua/AnyTeam/GUIScoreboard.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIGameEnd.lua", "lua/AnyTeam/GUIGameEnd.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUITechMap.lua", "lua/AnyTeam/GUITechMap.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUICommanderOrders.lua", "lua/AnyTeam/GUICommanderOrders.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIReadyRoomOrders.lua", "lua/AnyTeam/GUIReadyRoomOrders.lua", "replace" )
ModLoader.SetupFileHook( "lua/Scoreboard.lua", "lua/AnyTeam/Scoreboard.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIVoiceChat.lua", "lua/AnyTeam/GUIVoiceChat.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIDamageIndicators.lua", "lua/AnyTeam/GUIDamageIndicators.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIInsight_PlayerHealthbars.lua", "lua/AnyTeam/GUIInsight_PlayerHealthbars.lua", "replace" )
ModLoader.SetupFileHook( "lua/GUIInsight_PlayerFrames.lua", "lua/AnyTeam/GUIInsight_PlayerFrames.lua", "replace" )

