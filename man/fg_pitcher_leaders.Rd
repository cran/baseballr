% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fg_pitcher_leaders.R
\name{fg_pitcher_leaders}
\alias{fg_pitcher_leaders}
\title{\strong{Scrape Pitcher Leaderboards from FanGraphs}}
\usage{
fg_pitcher_leaders(
  age = "",
  pos = "all",
  stats = "pit",
  lg = "all",
  qual = "0",
  startseason = "2023",
  endseason = "2023",
  startdate = "",
  enddate = "",
  month = "0",
  hand = "",
  team = "0",
  pageitems = "10000",
  pagenum = "1",
  ind = "0",
  rost = "0",
  players = "",
  type = "8",
  postseason = "",
  sortdir = "default",
  sortstat = "WAR"
)
}
\arguments{
\item{age}{(integer) Age of players}

\item{pos}{(character) Position of players, defaults to "all". To exclude pitchers, use "np".}

\item{stats}{(character) Statistic to return. Defaults to "bat".}

\item{lg}{(character) League to return. Defaults to "all". Options are "al", "nl", or "all".}

\item{qual}{(character) Whether you want only batters/pitchers that qualified in a given season, or the minimum number of plate appearances for inclusion. If you only want qualified hitters, use qual. If a minimum number of plate appearaces/innings pitched, use the number desired. Defaults to "y".}

\item{startseason}{(character) Season for which you want to scrape the data.}

\item{endseason}{(character) Last season for which you want data.}

\item{startdate}{(character) Start date for which you want data.}

\item{enddate}{(character) End date for which you want data.}

\item{month}{(character) Month for which you want data.}

\item{hand}{(character) Handedness of batter. Options are "L", "R", or "B". Empty string returns all.}

\item{team}{(character) Teams for which you want data, comma separated.}

\item{pageitems}{(character) Number of items per page.}

\item{pagenum}{(character) Page number.}

\item{ind}{(character) Whether or not to break the seasons out individual, or roll them up together. 1 = split seasons, 0 = aggregate seasons.}

\item{rost}{(character) Whether or not to include players on the roster. 1 = include, 0 = exclude.}

\item{players}{(character) Whether or not to include players on the roster. 1 = include only active roster players, 0 = exclude.}

\item{type}{(character) Defaults to 8, which is the standard leaderboard. The values for the leaderboards appear to go to from type = 0 to 48+, which correspond to links on the leaderboard page.}

\item{postseason}{(logical) Whether or not to include postseason data. TRUE = include postseason, FALSE = exclude postseason.}

\item{sortdir}{(character) Sort direction. Options are "asc" or "desc" or "default".}

\item{sortstat}{(character) Sort by stat. Default is "WAR".}
}
\value{
A data frame of pitcher data.\tabular{ll}{
   col_name \tab types \cr
   Season \tab integer \cr
   team_name \tab character \cr
   Throws \tab character \cr
   xMLBAMID \tab integer \cr
   PlayerNameRoute \tab character \cr
   PlayerName \tab character \cr
   playerid \tab integer \cr
   Age \tab integer \cr
   AgeRng \tab character \cr
   SeasonMin \tab integer \cr
   SeasonMax \tab integer \cr
   W \tab integer \cr
   L \tab integer \cr
   ERA \tab numeric \cr
   G \tab integer \cr
   GS \tab integer \cr
   CG \tab integer \cr
   ShO \tab integer \cr
   SV \tab integer \cr
   BS \tab integer \cr
   IP \tab numeric \cr
   TBF \tab integer \cr
   H \tab integer \cr
   R \tab integer \cr
   ER \tab integer \cr
   HR \tab integer \cr
   BB \tab integer \cr
   IBB \tab integer \cr
   HBP \tab integer \cr
   WP \tab integer \cr
   BK \tab integer \cr
   SO \tab integer \cr
   GB \tab integer \cr
   FB \tab integer \cr
   LD \tab integer \cr
   IFFB \tab integer \cr
   Pitches \tab integer \cr
   Balls \tab integer \cr
   Strikes \tab integer \cr
   RS \tab integer \cr
   IFH \tab integer \cr
   BU \tab integer \cr
   BUH \tab integer \cr
   K_9 \tab numeric \cr
   BB_9 \tab numeric \cr
   K_BB \tab numeric \cr
   H_9 \tab numeric \cr
   HR_9 \tab numeric \cr
   AVG \tab numeric \cr
   WHIP \tab numeric \cr
   BABIP \tab numeric \cr
   LOB_pct \tab numeric \cr
   FIP \tab numeric \cr
   GB_FB \tab numeric \cr
   LD_pct \tab numeric \cr
   GB_pct \tab numeric \cr
   FB_pct \tab numeric \cr
   IFFB_pct \tab numeric \cr
   HR_FB \tab numeric \cr
   IFH_pct \tab numeric \cr
   BUH_pct \tab numeric \cr
   TTO_pct \tab numeric \cr
   CFraming \tab numeric \cr
   Starting \tab numeric \cr
   Start_IP \tab numeric \cr
   RAR \tab numeric \cr
   WAR \tab numeric \cr
   Dollars \tab numeric \cr
   RA9-Wins \tab numeric \cr
   LOB-Wins \tab numeric \cr
   BIP-Wins \tab numeric \cr
   BS-Wins \tab numeric \cr
   tERA \tab numeric \cr
   xFIP \tab numeric \cr
   WPA \tab numeric \cr
   WPA_minus \tab numeric \cr
   WPA_plus \tab numeric \cr
   RE24 \tab numeric \cr
   REW \tab numeric \cr
   pLI \tab numeric \cr
   inLI \tab numeric \cr
   gmLI \tab numeric \cr
   exLI \tab numeric \cr
   Pulls \tab integer \cr
   Games \tab integer \cr
   WPA_LI \tab numeric \cr
   Clutch \tab numeric \cr
   FBall_pct \tab numeric \cr
   FBv \tab numeric \cr
   SL_pct \tab numeric \cr
   SLv \tab numeric \cr
   CT_pct \tab numeric \cr
   CTv \tab numeric \cr
   CB_pct \tab numeric \cr
   CBv \tab numeric \cr
   SF_pct \tab numeric \cr
   SFv \tab numeric \cr
   XX_pct \tab numeric \cr
   wFB \tab numeric \cr
   wSL \tab numeric \cr
   wCT \tab numeric \cr
   wCB \tab numeric \cr
   wSF \tab numeric \cr
   wFB_C \tab numeric \cr
   wSL_C \tab numeric \cr
   wCT_C \tab numeric \cr
   wCB_C \tab numeric \cr
   wSF_C \tab numeric \cr
   O-Swing_pct \tab numeric \cr
   Z-Swing_pct \tab numeric \cr
   Swing_pct \tab numeric \cr
   O-Contact_pct \tab numeric \cr
   Z-Contact_pct \tab numeric \cr
   Contact_pct \tab numeric \cr
   Zone_pct \tab numeric \cr
   F-Strike_pct \tab numeric \cr
   SwStr_pct \tab numeric \cr
   CStr_pct \tab numeric \cr
   C+SwStr_pct \tab numeric \cr
   HLD \tab integer \cr
   SD \tab integer \cr
   MD \tab integer \cr
   ERA- \tab numeric \cr
   FIP- \tab numeric \cr
   xFIP- \tab numeric \cr
   K_pct \tab numeric \cr
   BB_pct \tab numeric \cr
   K-BB_pct \tab numeric \cr
   SIERA \tab numeric \cr
   kwERA \tab numeric \cr
   RS_9 \tab numeric \cr
   E-F \tab numeric \cr
   Pull \tab integer \cr
   Cent \tab integer \cr
   Oppo \tab integer \cr
   Soft \tab integer \cr
   Med \tab integer \cr
   Hard \tab integer \cr
   bipCount \tab integer \cr
   Pull_pct \tab numeric \cr
   Cent_pct \tab numeric \cr
   Oppo_pct \tab numeric \cr
   Soft_pct \tab numeric \cr
   Med_pct \tab numeric \cr
   Hard_pct \tab numeric \cr
   K_9+ \tab numeric \cr
   BB_9+ \tab numeric \cr
   K_BB+ \tab numeric \cr
   H_9+ \tab numeric \cr
   HR_9+ \tab numeric \cr
   AVG+ \tab numeric \cr
   WHIP+ \tab numeric \cr
   BABIP+ \tab numeric \cr
   LOB_pct+ \tab numeric \cr
   K_pct+ \tab numeric \cr
   BB_pct+ \tab numeric \cr
   LD_pct+ \tab numeric \cr
   GB_pct+ \tab numeric \cr
   FB_pct+ \tab numeric \cr
   HRFB_pct+ \tab numeric \cr
   Pull_pct+ \tab numeric \cr
   Cent_pct+ \tab numeric \cr
   Oppo_pct+ \tab numeric \cr
   Soft_pct+ \tab numeric \cr
   Med_pct+ \tab numeric \cr
   Hard_pct+ \tab numeric \cr
   xERA \tab numeric \cr
   pb_o_CH \tab numeric \cr
   pb_s_CH \tab numeric \cr
   pb_c_CH \tab numeric \cr
   pb_o_CU \tab numeric \cr
   pb_s_CU \tab numeric \cr
   pb_c_CU \tab numeric \cr
   pb_o_FF \tab numeric \cr
   pb_s_FF \tab numeric \cr
   pb_c_FF \tab numeric \cr
   pb_o_SI \tab numeric \cr
   pb_s_SI \tab numeric \cr
   pb_c_SI \tab numeric \cr
   pb_o_SL \tab numeric \cr
   pb_s_SL \tab numeric \cr
   pb_c_SL \tab numeric \cr
   pb_overall \tab numeric \cr
   pb_stuff \tab numeric \cr
   pb_command \tab numeric \cr
   pb_xRV100 \tab numeric \cr
   pb_ERA \tab numeric \cr
   sp_s_CH \tab numeric \cr
   sp_l_CH \tab numeric \cr
   sp_p_CH \tab numeric \cr
   sp_s_CU \tab numeric \cr
   sp_l_CU \tab numeric \cr
   sp_p_CU \tab numeric \cr
   sp_s_FF \tab numeric \cr
   sp_l_FF \tab numeric \cr
   sp_p_FF \tab numeric \cr
   sp_s_SI \tab numeric \cr
   sp_l_SI \tab numeric \cr
   sp_p_SI \tab numeric \cr
   sp_s_SL \tab numeric \cr
   sp_l_SL \tab numeric \cr
   sp_p_SL \tab numeric \cr
   sp_stuff \tab numeric \cr
   sp_location \tab numeric \cr
   sp_pitching \tab numeric \cr
   PPTV \tab integer \cr
   CPTV \tab integer \cr
   BPTV \tab integer \cr
   DSV \tab integer \cr
   DGV \tab integer \cr
   BTV \tab integer \cr
   rPPTV \tab numeric \cr
   rBPTV \tab numeric \cr
   EBV \tab integer \cr
   ESV \tab integer \cr
   rFTeamV \tab numeric \cr
   rBTeamV \tab numeric \cr
   rTV \tab numeric \cr
   pfx_FA_pct \tab numeric \cr
   pfx_SI_pct \tab numeric \cr
   pfx_SL_pct \tab numeric \cr
   pfx_CU_pct \tab numeric \cr
   pfx_CH_pct \tab numeric \cr
   pfx_vFA \tab numeric \cr
   pfx_vSI \tab numeric \cr
   pfx_vSL \tab numeric \cr
   pfx_vCU \tab numeric \cr
   pfx_vCH \tab numeric \cr
   pfx_FA-X \tab numeric \cr
   pfx_SI-X \tab numeric \cr
   pfx_SL-X \tab numeric \cr
   pfx_CU-X \tab numeric \cr
   pfx_CH-X \tab numeric \cr
   pfx_FA-Z \tab numeric \cr
   pfx_SI-Z \tab numeric \cr
   pfx_SL-Z \tab numeric \cr
   pfx_CU-Z \tab numeric \cr
   pfx_CH-Z \tab numeric \cr
   pfx_wFA \tab numeric \cr
   pfx_wSI \tab numeric \cr
   pfx_wSL \tab numeric \cr
   pfx_wCU \tab numeric \cr
   pfx_wCH \tab numeric \cr
   pfx_wFA_C \tab numeric \cr
   pfx_wSI_C \tab numeric \cr
   pfx_wSL_C \tab numeric \cr
   pfx_wCU_C \tab numeric \cr
   pfx_wCH_C \tab numeric \cr
   pfx_O-Swing_pct \tab numeric \cr
   pfx_Z-Swing_pct \tab numeric \cr
   pfx_Swing_pct \tab numeric \cr
   pfx_O-Contact_pct \tab numeric \cr
   pfx_Z-Contact_pct \tab numeric \cr
   pfx_Contact_pct \tab numeric \cr
   pfx_Zone_pct \tab numeric \cr
   pfx_Pace \tab numeric \cr
   pi_CH_pct \tab numeric \cr
   pi_CU_pct \tab numeric \cr
   pi_FA_pct \tab numeric \cr
   pi_SI_pct \tab numeric \cr
   pi_SL_pct \tab numeric \cr
   pi_vCH \tab numeric \cr
   pi_vCU \tab numeric \cr
   pi_vFA \tab numeric \cr
   pi_vSI \tab numeric \cr
   pi_vSL \tab numeric \cr
   pi_CH-X \tab numeric \cr
   pi_CU-X \tab numeric \cr
   pi_FA-X \tab numeric \cr
   pi_SI-X \tab numeric \cr
   pi_SL-X \tab numeric \cr
   pi_CH-Z \tab numeric \cr
   pi_CU-Z \tab numeric \cr
   pi_FA-Z \tab numeric \cr
   pi_SI-Z \tab numeric \cr
   pi_SL-Z \tab numeric \cr
   pi_wCH \tab numeric \cr
   pi_wCU \tab numeric \cr
   pi_wFA \tab numeric \cr
   pi_wSI \tab numeric \cr
   pi_wSL \tab numeric \cr
   pi_wCH_C \tab numeric \cr
   pi_wCU_C \tab numeric \cr
   pi_wFA_C \tab numeric \cr
   pi_wSI_C \tab numeric \cr
   pi_wSL_C \tab numeric \cr
   pi_O-Swing_pct \tab numeric \cr
   pi_Z-Swing_pct \tab numeric \cr
   pi_Swing_pct \tab numeric \cr
   pi_O-Contact_pct \tab numeric \cr
   pi_Z-Contact_pct \tab numeric \cr
   pi_Contact_pct \tab numeric \cr
   pi_Zone_pct \tab numeric \cr
   pi_Pace \tab numeric \cr
   Events \tab integer \cr
   EV \tab numeric \cr
   LA \tab numeric \cr
   Barrels \tab integer \cr
   Barrel_pct \tab numeric \cr
   maxEV \tab numeric \cr
   HardHit \tab integer \cr
   HardHit_pct \tab numeric \cr
   Q \tab numeric \cr
   TG \tab integer \cr
   TIP \tab numeric \cr
   team_name_abb \tab character \cr
   teamid \tab integer \cr
   CH_pct \tab numeric \cr
   CHv \tab numeric \cr
   wCH \tab numeric \cr
   wCH_C \tab numeric \cr
   pb_o_FS \tab numeric \cr
   pb_s_FS \tab numeric \cr
   pb_c_FS \tab numeric \cr
   sp_s_FS \tab numeric \cr
   sp_l_FS \tab numeric \cr
   sp_p_FS \tab numeric \cr
   pfx_FS_pct \tab numeric \cr
   pfx_vFS \tab numeric \cr
   pfx_FS-X \tab numeric \cr
   pfx_FS-Z \tab numeric \cr
   pfx_wFS \tab numeric \cr
   pfx_wFS_C \tab numeric \cr
   pi_FS_pct \tab numeric \cr
   pi_vFS \tab numeric \cr
   pi_FS-X \tab numeric \cr
   pi_FS-Z \tab numeric \cr
   pi_wFS \tab numeric \cr
   pi_wFS_C \tab numeric \cr
   pb_o_FC \tab numeric \cr
   pb_s_FC \tab numeric \cr
   pb_c_FC \tab numeric \cr
   sp_s_FC \tab numeric \cr
   sp_l_FC \tab numeric \cr
   sp_p_FC \tab numeric \cr
   pfx_FC_pct \tab numeric \cr
   pfx_vFC \tab numeric \cr
   pfx_FC-X \tab numeric \cr
   pfx_FC-Z \tab numeric \cr
   pfx_wFC \tab numeric \cr
   pfx_wFC_C \tab numeric \cr
   pi_FC_pct \tab numeric \cr
   pi_vFC \tab numeric \cr
   pi_FC-X \tab numeric \cr
   pi_FC-Z \tab numeric \cr
   pi_wFC \tab numeric \cr
   pi_wFC_C \tab numeric \cr
   pb_o_KC \tab numeric \cr
   pb_s_KC \tab numeric \cr
   pb_c_KC \tab numeric \cr
   sp_s_KC \tab numeric \cr
   sp_l_KC \tab numeric \cr
   sp_p_KC \tab numeric \cr
   rBTV \tab numeric \cr
   pfx_KC_pct \tab numeric \cr
   pfx_vKC \tab numeric \cr
   pfx_KC-X \tab numeric \cr
   pfx_KC-Z \tab numeric \cr
   pfx_wKC \tab numeric \cr
   pfx_wKC_C \tab numeric \cr
   rCPTV \tab numeric \cr
   KN_pct \tab numeric \cr
   KNv \tab numeric \cr
   wKN \tab numeric \cr
   wKN_C \tab numeric \cr
   pfx_KN_pct \tab numeric \cr
   pfx_vKN \tab numeric \cr
   pfx_KN-X \tab numeric \cr
   pfx_KN-Z \tab numeric \cr
   pfx_wKN \tab numeric \cr
   pfx_wKN_C \tab numeric \cr
   pi_KN_pct \tab numeric \cr
   pi_XX_pct \tab numeric \cr
   pi_vKN \tab numeric \cr
   pi_vXX \tab numeric \cr
   pi_KN-X \tab numeric \cr
   pi_XX-X \tab numeric \cr
   pi_KN-Z \tab numeric \cr
   pi_XX-Z \tab numeric \cr
   pi_wKN \tab numeric \cr
   pi_wXX \tab numeric \cr
   pi_wKN_C \tab numeric \cr
   pi_wXX_C \tab numeric \cr
   sp_s_FO \tab numeric \cr
   sp_l_FO \tab numeric \cr
   sp_p_FO \tab numeric \cr
   pfx_FO_pct \tab numeric \cr
   pfx_vFO \tab numeric \cr
   pfx_FO-X \tab numeric \cr
   pfx_FO-Z \tab numeric \cr
   pfx_wFO \tab numeric \cr
   pfx_wFO_C \tab numeric \cr
   rDGV \tab numeric \cr
   pi_CS_pct \tab numeric \cr
   pi_vCS \tab numeric \cr
   pi_CS-X \tab numeric \cr
   pi_CS-Z \tab numeric \cr
   pi_wCS \tab numeric \cr
   pi_wCS_C \tab numeric \cr
   Relieving \tab numeric \cr
   Relief_IP \tab numeric \cr
   rDSV \tab numeric \cr
   pfx_EP_pct \tab numeric \cr
   pfx_vEP \tab numeric \cr
   pfx_EP-X \tab numeric \cr
   pfx_EP-Z \tab numeric \cr
   pfx_wEP \tab numeric \cr
   pfx_wEP_C \tab numeric \cr
   pfx_SC_pct \tab numeric \cr
   pfx_vSC \tab numeric \cr
   pfx_SC-X \tab numeric \cr
   pfx_SC-Z \tab numeric \cr
   pfx_wSC \tab numeric \cr
   pfx_wSC_C \tab numeric \cr
   pi_SB_pct \tab numeric \cr
   pi_vSB \tab numeric \cr
   pi_SB-X \tab numeric \cr
   pi_SB-Z \tab numeric \cr
   pi_wSB \tab numeric \cr
   pi_wSB_C \tab numeric \cr
}
}
\description{
\strong{Scrape Pitcher Leaderboards from FanGraphs}
}
\examples{
\donttest{
  try(fg_pitcher_leaders(startseason = 2023, endseason = 2023))
}
}
