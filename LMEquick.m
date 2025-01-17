function [Tsave,Psave,lmeModel_now] = LMEquick(covdata1,covdata2,cond1,cond2,sub1,sub2,contact1,contact2)
if ndims(covdata1) == 3
    Tsave = zeros(size(covdata1,[2 3]));
    Psave = zeros(size(covdata1,[2 3]));
    TFall = cat(1,covdata1,covdata2);
    condall = cat(1,cond1,cond2);
    suball = cat(1,sub1,sub2);
    contactall = cat(1,contact1,contact2);
    for rowi = 1:size(Tsave,1)
        tempData = arrayfun(@(x) table(TFall(:,rowi,x),condall,suball,contactall,'VariableNames', {'TFdata', 'condition','subject','electrode'}), 1:size(Tsave,2), 'UniformOutput', false);
        for ti = 1:length(tempData)
            tempData_now = tempData{ti};
            tempData_now.condition = nominal(tempData_now.condition);
            tempData_now.condition = reordercats(tempData_now.condition ,[2,1]);
            %       categories(tempData.condition)
            tempData_now.subject = nominal(tempData_now.subject);
            tempData_now.electrode = nominal(tempData_now.electrode);
            tempData{ti} = tempData_now;
        end
        
        lmeModel_now = cellfun(@(x) fitlme(x, 'TFdata~ condition + (1|subject) + (1|subject:electrode)'), tempData, 'UniformOutput', false);
        
        Tsave(rowi,:) = cell2mat(cellfun(@(x) x.Coefficients{2,4}, lmeModel_now, 'UniformOutput', false));
        Psave(rowi,:) = cell2mat(cellfun(@(x) x.Coefficients{2,6}, lmeModel_now, 'UniformOutput', false));
    end
else
    Tsave = zeros(1,size(covdata1,2));
    Psave = zeros(1,size(covdata1,2));
    TFall = cat(1,covdata1,covdata2);
    condall = cat(1,cond1,cond2);
    suball = cat(1,sub1,sub2);
    contactall = cat(1,contact1,contact2);
    
    tempData = arrayfun(@(x) table(TFall(:,x),condall,suball,contactall,'VariableNames', {'TFdata', 'condition','subject','electrode'}), 1:size(Tsave,2), 'UniformOutput', false);
    for ti = 1:length(tempData)
        tempData_now = tempData{ti};
        tempData_now.condition = nominal(tempData_now.condition);
        tempData_now.condition = reordercats(tempData_now.condition ,[2,1]);
        %       categories(tempData.condition)
        tempData_now.subject = nominal(tempData_now.subject);
        tempData_now.electrode = nominal(tempData_now.electrode);
        tempData{ti} = tempData_now;
    end
    
    lmeModel_now = cellfun(@(x) fitlme(x, 'TFdata~ condition + (1|subject) + (1|subject:electrode)'), tempData, 'UniformOutput', false);
    
    Tsave = cell2mat(cellfun(@(x) x.Coefficients{2,4}, lmeModel_now, 'UniformOutput', false));
    Psave = cell2mat(cellfun(@(x) x.Coefficients{2,6}, lmeModel_now, 'UniformOutput', false));
end
end