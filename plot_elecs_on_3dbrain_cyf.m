function  plot_elecs_on_3dbrain_cyf(elec_tkr_coors,plotsize,plotcolor,pb)

%% plot 3d brain

rhpial = ['E:\cyf_data\auditory hallucination\1. epilepsy\3. function\cvs_avg35_inMNI152\cvs_avg35_inMNI152\surf\rh.pial'];

lhpial = ['E:\cyf_data\auditory hallucination\1. epilepsy\3. function\cvs_avg35_inMNI152\cvs_avg35_inMNI152\surf\lh.pial'];
    
[vertex_coords1, faces1]=read_surf(rhpial);
% faces1 = faces1 + 1;

[vertex_coords2, faces2]=read_surf(lhpial);
% faces2 = faces2 + 1;

faces = [faces1;faces2+size(vertex_coords1,1)];

vertex_coords = [vertex_coords1;vertex_coords2];
        
if pb ==1
patch_handle = patch('faces',faces,'vertices',vertex_coords,'CDataMapping','scaled',  ...
    'facealpha',0.3,'EdgeColor','none','FaceVertexCData',[0.9 0.9 0.9],'FaceColor','flat');
end
axis equal;axis off;

material dull


hold on;

%% modify sizevec and colormat to make electrodes with different size\colors

sizevec = repmat(plotsize,[size(elec_tkr_coors,1) 1]);

colormat = repmat(plotcolor,[size(elec_tkr_coors,1) 1]);

%%  plot electrodes
bubbleplot3(elec_tkr_coors(:,1),elec_tkr_coors(:,2),elec_tkr_coors(:,3),sizevec,colormat);
%% adjust view angle and lightening

view(0,90);

hold on;

camlight('headlight');

camlight('headlight','infinite');

lighting gouraud

hrot = rotate3d;
    
set(hrot,'ActionPostCallback',@(~,~)relight); 
    
end


function relight()

clh = findobj(gcf,'Type','Light');
delete(clh);

camlight('headlight');

camlight('headlight','infinite');

lighting gouraud


end