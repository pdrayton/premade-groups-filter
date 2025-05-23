-------------------------------------------------------------------------------
-- Premade Groups Filter
-------------------------------------------------------------------------------
-- Copyright (C) 2024 Bernhard Saumweber
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-------------------------------------------------------------------------------

local PGF = select(2, ...)
local L = PGF.L
local C = PGF.C

C.SPECIALIZATIONS = {
    [ 250] = { class = "DEATHKNIGHT", spec = "BLOOD",         range = false, melee = true , hasBattleResurrection = true },
    [ 251] = { class = "DEATHKNIGHT", spec = "FROST",         range = false, melee = true , hasBattleResurrection = true },
    [ 252] = { class = "DEATHKNIGHT", spec = "UNHOLY",        range = false, melee = true , hasBattleResurrection = true },

    [ 577] = { class = "DEMONHUNTER", spec = "HAVOC",         range = false, melee = true , hasBattleResurrection = false },
    [ 581] = { class = "DEMONHUNTER", spec = "VENGEANCE",     range = false, melee = true , hasBattleResurrection = false },

    [ 102] = { class = "DRUID",       spec = "BALANCE",       range = true,  melee = false, hasBattleResurrection = true },
    [ 103] = { class = "DRUID",       spec = "FERAL",         range = false, melee = true , hasBattleResurrection = true },
    [ 104] = { class = "DRUID",       spec = "GUARDIAN",      range = false, melee = true , hasBattleResurrection = true },
    [ 105] = { class = "DRUID",       spec = "RESTORATION",   range = true,  melee = false, hasBattleResurrection = true },

    [1467] = { class = "EVOKER",      spec = "DEVASTATION",   range = true,  melee = false, hasBattleResurrection = false },
    [1468] = { class = "EVOKER",      spec = "PRESERVATION",  range = true,  melee = false, hasBattleResurrection = false },
    [1473] = { class = "EVOKER",      spec = "AUGMENTATION",  range = true,  melee = false, hasBattleResurrection = false },

    [ 253] = { class = "HUNTER",      spec = "BEASTMASTERY",  range = true,  melee = false, hasBattleResurrection = false },
    [ 254] = { class = "HUNTER",      spec = "MARKSMANSHIP",  range = true,  melee = false, hasBattleResurrection = false },
    [ 255] = { class = "HUNTER",      spec = "SURVIVAL",      range = false, melee = true , hasBattleResurrection = false },

    [  65] = { class = "PALADIN",     spec = "HOLY",          range = true,  melee = false, hasBattleResurrection = true },
    [  66] = { class = "PALADIN",     spec = "PROTECTION",    range = false, melee = true , hasBattleResurrection = true },
    [  70] = { class = "PALADIN",     spec = "RETRIBUTION",   range = false, melee = true , hasBattleResurrection = true },

    [ 256] = { class = "PRIEST",      spec = "DISCIPLINE",    range = true,  melee = false, hasBattleResurrection = false },
    [ 257] = { class = "PRIEST",      spec = "HOLY",          range = true,  melee = false, hasBattleResurrection = false },
    [ 258] = { class = "PRIEST",      spec = "SHADOW",        range = true,  melee = false, hasBattleResurrection = false },

    [  62] = { class = "MAGE",        spec = "ARCANE",        range = true,  melee = false, hasBattleResurrection = false },
    [  63] = { class = "MAGE",        spec = "FIRE",          range = true,  melee = false, hasBattleResurrection = false },
    [  64] = { class = "MAGE",        spec = "FROST",         range = true,  melee = false, hasBattleResurrection = false },

    [ 268] = { class = "MONK",        spec = "BREWMASTER",    range = false, melee = true , hasBattleResurrection = false },
    [ 269] = { class = "MONK",        spec = "WINDWALKER",    range = false, melee = true , hasBattleResurrection = false },
    [ 270] = { class = "MONK",        spec = "MISTWEAVER",    range = true,  melee = false, hasBattleResurrection = false },

    [ 259] = { class = "ROGUE",       spec = "ASSASSINATION", range = false, melee = true , hasBattleResurrection = false },
    [ 260] = { class = "ROGUE",       spec = "OUTLAW",        range = false, melee = true , hasBattleResurrection = false },
    [ 261] = { class = "ROGUE",       spec = "SUBTLETY",      range = false, melee = true , hasBattleResurrection = false },

    [ 262] = { class = "SHAMAN",      spec = "ELEMENTAL",     range = true,  melee = false, hasBattleResurrection = false },
    [ 263] = { class = "SHAMAN",      spec = "ENHANCEMENT",   range = false, melee = true , hasBattleResurrection = false },
    [ 264] = { class = "SHAMAN",      spec = "RESTORATION",   range = true,  melee = false, hasBattleResurrection = false },

    [ 265] = { class = "WARLOCK",     spec = "AFFLICTION",    range = true,  melee = false, hasBattleResurrection = true },
    [ 266] = { class = "WARLOCK",     spec = "DEMONOLOGY",    range = true,  melee = false, hasBattleResurrection = true },
    [ 267] = { class = "WARLOCK",     spec = "DESTRUCTION",   range = true,  melee = false, hasBattleResurrection = true },

    [  71] = { class = "WARRIOR",     spec = "ARMS",          range = false, melee = true , hasBattleResurrection = false },
    [  72] = { class = "WARRIOR",     spec = "FURY",          range = false, melee = true , hasBattleResurrection = false },
    [  73] = { class = "WARRIOR",     spec = "PROTECTION",    range = false, melee = true , hasBattleResurrection = false },
}

local specs = {}

--- Initializes the table of localized specializations
function PGF.InitSpecializations()
    for specID, specInfo in pairs(C.SPECIALIZATIONS) do
        local id, specLocalized, description, icon, role, class, classLocalized = GetSpecializationInfoByID(specID)
        specs[specID] = {
            specID = specID,
            class = class, -- should be the same as specInfo.class
            classLocalized = classLocalized,
            classKeyword = string.format("%ss", class:lower()), -- "warriors"
            spec = specInfo.spec,
            specLocalized = specLocalized,
            specKeyword = string.format("%s_%ss", specInfo.spec:lower(), class:lower()), -- "arms_warriors"
            specIcon = icon,
            role = role,
            roleClassKeyword = string.format("%s_%ss", C.ROLE_PREFIX[role], class:lower()), -- "tank_warriors"
            classRoleKeyword = string.format("%s_%s", class:lower(), C.ROLE_SUFFIX[role]), -- "warrior_tanks"
            armor = C.DPS_CLASS_TYPE[class].armor,
            range = specInfo.range or false,
            melee = specInfo.melee or false,
            hasBattleResurrection = specInfo.hasBattleResurrection or false,
            classColor = RAID_CLASS_COLORS[class] or NORMAL_FONT_COLOR,
            roleAtlas = C.ROLE_ATLAS[role],
            roleMarkup = string.format("|A:%s:0:0:0:0|a", C.ROLE_ATLAS[role]),
        }
    end
end

function PGF.GetAllSpecializations()
    return specs
end

--- Attemps to get the correct specialization info based on the class and localized specialization name
--- as returned by C_LFGList.GetSearchResultMemberInfo
function PGF.GetSpecializationInfoByLocalizedName(class, specLocalized)
    for specID, specInfo in pairs(specs) do
        if specInfo.class == class and specInfo.specLocalized == specLocalized then
            return specInfo
        end
    end
    return nil
end

function PGF.GetSpecializationInfoForUnit(unit)
    local specID = GetInspectSpecialization(unit)
    return specs[specID]
end
