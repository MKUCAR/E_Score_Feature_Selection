function  [S_O]=FSY_Eta(Data,x)
    [Sa Su]=size(Data);
    Eta_Score=[linspace(1, Su-1, Su-1)' linspace(0, 0, Su-1)'];
    for i=1:Su-1
        S=[Data(:,i) Data(:,end)];
        % Eta Korelasyon Katsay�s� Hesaplamas�
        Eta_Score(i,2)=Eta_kor(S);
    end
    Eta_Score=sortrows(Eta_Score,2,'descend');
    T_Eta=toc;
    %% Se�ilecek �zelliklerin belirlenmesi
    % %x �zellikler se�ilecektir.
    N=round(x*(Su-1)/100);
    Et_Score=Eta_Score(1:N,:);
    Et_Score=sortrows(Et_Score);
    S_O=[Data(:,Et_Score(:,1)) Data(:,end)];
end