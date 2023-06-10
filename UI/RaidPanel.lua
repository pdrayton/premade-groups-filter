-------------------------------------------------------------------------------
-- Premade Groups Filter
-------------------------------------------------------------------------------
-- Copyright (C) 2022 Elotheon-Arthas-EU
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

local RaidPanel = CreateFrame("Frame")

function RaidPanel:OnLoad()
    PGF.Logger:Debug("RaidPanel:OnLoad")
    self.name = "raid"
    self:SetPoint("TOPLEFT")
    self:SetPoint("BOTTOMRIGHT")
end

function RaidPanel:Init(state)
    PGF.Logger:Debug("RaidPanel:Init")
    self.state = state
end

function RaidPanel:OnShow()
    PGF.Logger:Debug("RaidPanel:OnShow")
end

function RaidPanel:OnHide()
    PGF.Logger:Debug("RaidPanel:OnHide")
end

function RaidPanel:OnReset()
    PGF.Logger:Debug("RaidPanel:OnHide")
end

function RaidPanel:GetFilterRaidPanel()
    PGF.Logger:Debug("RaidPanel:GetFilterRaidPanel")
end

RaidPanel:OnLoad()
PGF.Dialog:RegisterPanel("c3f0", RaidPanel) -- raid
PGF.Dialog:RegisterPanel("c3f1", RaidPanel) -- raid recommended
PGF.Dialog:RegisterPanel("c3f2", RaidPanel) -- raid not recommended
