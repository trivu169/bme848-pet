function varargout = bme848_pet_ui(varargin)
% BME848_PET_UI MATLAB code for bme848_pet_ui.fig
%      BME848_PET_UI, by itself, creates a new BME848_PET_UI or raises the existing
%      singleton*.
%
%      H = BME848_PET_UI returns the handle to a new BME848_PET_UI or the handle to
%      the existing singleton*.
%
%      BME848_PET_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BME848_PET_UI.M with the given input arguments.
%
%      BME848_PET_UI('Property','Value',...) creates a new BME848_PET_UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bme848_pet_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bme848_pet_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bme848_pet_ui

% Last Modified by GUIDE v2.5 26-Feb-2020 17:44:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bme848_pet_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @bme848_pet_ui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before bme848_pet_ui is made visible.
function bme848_pet_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bme848_pet_ui (see VARARGIN)

% Choose default command line output for bme848_pet_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bme848_pet_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bme848_pet_ui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function path_pet_ui_Callback(hObject, eventdata, handles)
% hObject    handle to path_pet_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path_pet_ui as text
%        str2double(get(hObject,'String')) returns contents of path_pet_ui as a double


% --- Executes during object creation, after setting all properties.
function path_pet_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_pet_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fname_pet_ui_Callback(hObject, eventdata, handles)
% hObject    handle to fname_pet_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fname_pet_ui as text
%        str2double(get(hObject,'String')) returns contents of fname_pet_ui as a double

% --- Executes during object creation, after setting all properties.
function fname_pet_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fname_pet_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in suffix_pet_ui.
function suffix_pet_ui_Callback(hObject, eventdata, handles)
% hObject    handle to suffix_pet_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns suffix_pet_ui contents as cell array
%        contents{get(hObject,'Value')} returns selected item from suffix_pet_ui

% --- Executes during object creation, after setting all properties.
function suffix_pet_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to suffix_pet_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_data.
function load_data_Callback(hObject, eventdata, handles)
% hObject    handle to load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status_stext, 'String',...
    'Loading data...');
clc;

[data_raw_pet, num_slice_pet, img_size_pet, data_path_pet] = loadData(handles.fname_pet_ui,...
    handles.path_pet_ui, handles.suffix_pet_ui, handles.imgsize_pet_ui);
[data_raw_ct, num_slice_ct, img_size_ct, data_path_ct] = loadData(handles.fname_ct_ui,...
    handles.path_ct_ui, handles.suffix_ct_ui, handles.imgsize_ct_ui);

% Reset handles
set(handles.sliceLow_ui, 'String', num2str(1));
set(handles.sliceHigh_ui, 'String', num2str(num_slice_pet));
set(handles.cmin_ui, 'String', num2str(0));
set(handles.cmax_ui, 'String', num2str(0));

% This is the main image data that we will work with
img_data_pet = reshape(data_raw_pet, [img_size_pet img_size_pet num_slice_pet]); 
handles.img_data_pet = img_data_pet;
img_data_ct_pre = reshape(data_raw_ct, [img_size_ct img_size_ct num_slice_ct]); 
for i = 1:size(img_data_ct_pre,3)
    img_data_ct(:,:,i) = imresize(img_data_pet(:,:,i),...
        [img_size_pet, img_size_pet], 'Antialiasing', true);
end

handles.data_path_pet = data_path_pet;
handles.img_data_pet = img_data_pet;
guidata(hObject,handles);

% angle = get(handles.angle_ui, 'String'); % Get file name
% angle = str2double(angle);
% data_norm = normalize(img_data);
% data_rotated = rotate3d(data_norm, angle);
% pre_proj = weightDepth(data_rotated);
% data_proj = projection(pre_proj);
% imagesc(data_proj);
updateFig(handles, hObject);
set(handles.status_stext, 'String',...
    'Done!');

% axis off
assignin('base', 'pet', img_data_pet);
assignin('base', 'ct', img_data_ct);

function [data_raw, num_slice, img_size, data_path] = loadData(...
    fname_ui, path_ui,suffix_ui, imgsize_ui)
fname = get(fname_ui, 'String'); % Get file name
path_to_file = get(path_ui, 'String'); % Get its directory
suffix = cellstr(get(suffix_ui, 'String')); % Get its suffix
suffix = suffix{get(suffix_ui, 'Value')};
data_path = [path_to_file, fname, suffix];
img_size = str2double(get(imgsize_ui,...
    'String')); % Input image size
% Load data
file_id = fopen(data_path, 'r');
if strcmp(suffix, '.fl')
    data_raw = fread(file_id, inf, 'float');
else
    data_raw = fread(file_id, inf, 'int16');
end
num_slice = size(data_raw,1)/(img_size^2);
fclose(file_id);

function a=rotate3d(a, angle)
a = imrotate3(a,angle,[0,0,1]);

function a=projection(a)
a = squeeze(max(a,[],2));
a = a';

function angle_ui_Callback(hObject, eventdata, handles)
% hObject    handle to angle_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle_ui as text
%        str2double(get(hObject,'String')) returns contents of angle_ui as a double


% --- Executes during object creation, after setting all properties.
function angle_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function a_weighted=weightDepth(a, handles)
% At 511 keV from the annihilation in PET, the mass attenuation coefficient
% is the same for all organs: mu/p = 0.1 g/cm^2 = 1 m^2/kg
wchoice = cellstr(get(handles.wchoice_ui, 'String')); % Get its suffix
wchoice = wchoice{get(handles.wchoice_ui, 'Value')};
switch wchoice
    case 'None'
        w = ones(size(a,2));
    case 'Linear'
        w = linspace(0,1,size(a,2));
    case 'Exponential'
        w = linspace(0,1,size(a,2));
        w = exp(-w);
end
a_weighted = bsxfun(@times, a, w);
% for i = 1:size(pet,3)
% pet_resized(:,:,i) = imresize(pet(:,:,i),...
%     [size(ct,1), size(ct,2)], 'Antialiasing', true);
% end

function a=norm(a)
a = a - min(min(min(a)));
a = a./max(max(max(a)));


% --- Executes on button press in wdepth_ui.
function wdepth_ui_Callback(hObject, eventdata, handles)
% hObject    handle to wdepth_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of wdepth_ui



function sliceLow_ui_Callback(hObject, eventdata, handles)
% hObject    handle to sliceLow_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sliceLow_ui as text
%        str2double(get(hObject,'String')) returns contents of sliceLow_ui as a double


% --- Executes during object creation, after setting all properties.
function sliceLow_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliceLow_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sliceHigh_ui_Callback(hObject, eventdata, handles)
% hObject    handle to sliceHigh_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sliceHigh_ui as text
%        str2double(get(hObject,'String')) returns contents of sliceHigh_ui as a double


% --- Executes during object creation, after setting all properties.
function sliceHigh_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliceHigh_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveData_ui.
function saveData_ui_Callback(hObject, eventdata, handles)
% hObject    handle to saveData_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
projID = fopen([get(handles.fname_pet_ui, 'String'), '_proj.fl'],'w+');
fwrite(projID,handles.img_data_pet,'float32');
fclose(projID);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over wdepth_ui.
function wdepth_ui_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to wdepth_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function pre_proj = updateFig(handles, hObject)
clc
angle = get(handles.angle_ui, 'String'); % Get file name
angle = str2double(angle);
img_data_pet = handles.img_data_pet;
% data_norm = normalize(img_data);
set(handles.status_stext, 'String',...
    'Rotating matrix...');
data_rotated = rotate3d(img_data_pet, angle);
pre_proj = weightDepth(data_rotated, handles);
set(handles.status_stext, 'String',...
    'Projecting...');
data_proj = projection(pre_proj); % Perform MIP
sliceLow = get(handles.sliceLow_ui, 'String'); 
sliceLow = str2double(sliceLow);
sliceHigh = get(handles.sliceHigh_ui, 'String'); 
sliceHigh = str2double(sliceHigh);
data_proj(sliceLow,:) = max(max(max(img_data_pet)));
data_proj(sliceHigh, :) = max(max(max(img_data_pet)));
imagesc(data_proj);
cl = caxis;
if str2double(get(handles.cmax_ui, 'String')) == 0
    set(handles.cmin_ui, 'String', num2str(cl(1)));
    set(handles.cmax_ui, 'String', num2str(cl(2)));
end
cur_cmin = str2double(get(handles.cmin_ui, 'String'));
cur_cmax = str2double(get(handles.cmax_ui, 'String'));

if cl ~= [cur_cmin, cur_cmax]
    caxis([cur_cmin, cur_cmax]);
end
% This is the current image data shown in the figure before projection
handles.pre_proj = pre_proj;
guidata(hObject,handles);
set(handles.status_stext, 'String',...
    'Done!');



function cmin_ui_Callback(hObject, eventdata, handles)
% hObject    handle to cmin_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cmin_ui as text
%        str2double(get(hObject,'String')) returns contents of cmin_ui as a double


% --- Executes during object creation, after setting all properties.
function cmin_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmin_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cmax_ui_Callback(hObject, eventdata, handles)
% hObject    handle to cmax_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cmax_ui as text
%        str2double(get(hObject,'String')) returns contents of cmax_ui as a double


% --- Executes during object creation, after setting all properties.
function cmax_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmax_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over cmax_ui.
function cmax_ui_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to cmax_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(gcf, 'ButtonDownFcn', @updateFig(handles, hObject));


% --- Executes on key press with focus on cmax_ui and none of its controls.
function cmax_ui_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to cmax_ui (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in apply_ui.
function apply_ui_Callback(hObject, eventdata, handles)
% hObject    handle to apply_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateFig(handles, hObject);


% --- Executes on key press with focus on figure1 or any of its controls.
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(gcf,'currentkey'), 'return')
    updateFig(handles, hObject);
end


% --- Executes on button press in getdir_ui.
function getdir_ui_Callback(hObject, eventdata, handles)
% hObject    handle to getdir_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_path = uigetdir;
img_path = [img_path, '\'];
set(handles.path_pet_ui, 'String', img_path);



function path_ct_ui_Callback(hObject, eventdata, handles)
% hObject    handle to path_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path_ct_ui as text
%        str2double(get(hObject,'String')) returns contents of path_ct_ui as a double


% --- Executes during object creation, after setting all properties.
function path_ct_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fname_ct_ui_Callback(hObject, eventdata, handles)
% hObject    handle to fname_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fname_ct_ui as text
%        str2double(get(hObject,'String')) returns contents of fname_ct_ui as a double


% --- Executes during object creation, after setting all properties.
function fname_ct_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fname_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in suffix_ct_ui.
function suffix_ct_ui_Callback(hObject, eventdata, handles)
% hObject    handle to suffix_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns suffix_ct_ui contents as cell array
%        contents{get(hObject,'Value')} returns selected item from suffix_ct_ui


% --- Executes during object creation, after setting all properties.
function suffix_ct_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to suffix_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function imgsize_ct_ui_Callback(hObject, eventdata, handles)
% hObject    handle to imgsize_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imgsize_ct_ui as text
%        str2double(get(hObject,'String')) returns contents of imgsize_ct_ui as a double


% --- Executes during object creation, after setting all properties.
function imgsize_ct_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imgsize_ct_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in wchoice_ui.
function wchoice_ui_Callback(hObject, eventdata, handles)
% hObject    handle to wchoice_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns wchoice_ui contents as cell array
%        contents{get(hObject,'Value')} returns selected item from wchoice_ui


% --- Executes during object creation, after setting all properties.
function wchoice_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wchoice_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
