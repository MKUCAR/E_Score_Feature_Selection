%% Eta Korelasyon kastayýsý Tabanlý Özellik Seçme
close all; clear; clc;
%% Örnek matris
load Gruplu
Data=A;
x=20; % Özelliklerin %20'sini seçer.
[S_O]=FSY_Eta(Data,x);