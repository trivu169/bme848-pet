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

% Last Modified by GUIDE v2.5 25-Feb-2020 15:00:49

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



function path_ui_Callback(hObject, eventdata, handles)
% hObject    handle to path_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path_ui as text
%        str2double(get(hObject,'String')) returns contents of path_ui as a double


% --- Executes during object creation, after setting all properties.
function path_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fname_ui_Callback(hObject, eventdata, handles)
% hObject    handle to fname_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fname_ui as text
%        str2double(get(hObject,'String')) returns contents of fname_ui as a double

% --- Executes during object creation, after setting all properties.
function fname_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fname_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in suffix_ui.
function suffix_ui_Callback(hObject, eventdata, handles)
% hObject    handle to suffix_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns suffix_ui contents as cell array
%        contents{get(hObject,'Value')} returns selected item from suffix_ui

% --- Executes during object creation, after setting all properties.
function suffix_ui_CreateFcn(hObject, eventdata, handles)
% hObject    handle to suffix_ui (see GCBO)
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
clc;

fname = get(handles.fname_ui, 'String'); % Get file name
path_to_file = get(handles.path_ui, 'String'); % Get its directory
suffix = cellstr(get(handles.suffix_ui, 'String')); % Get its suffix
suffix = suffix{get(handles.suffix_ui, 'Value')};
data_path = [path_to_file, fname, suffix];
img_size = str2double(get(handles.imgsize_ui,...
    'String')); % Input image size

% if strcmp(suffix, '.tar.gz')
%     data_path = gunzip(data_path);
%     data_path = data_path{1};
% end

% Load data
file_id = fopen(data_path, 'r');
data_raw = fread(file_id, inf, 'float');
num_slice = size(data_raw,1)/(img_size^2);

% This is the main image data that we will work with
img_data = reshape(data_raw, [img_size img_size num_slice]); 
data = struct('img_data', img_data); % Set the image data to workspace
set(handles.img_ui, 'UserData', data);

fclose(file_id);
angle = get(handles.angle_ui, 'String'); % Get file name
angle = str2double(angle);
data_rotated = rotate3d(img_data, angle);
data_proj = projection(data_rotated);
imagesc(data_proj);
cl = caxis;
caxis([cl(1), cl(2)-700000]);
% axis off
% assignin('base', 'data', data);

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


% --- Executes on button press in applyAngle_ui.
function applyAngle_ui_Callback(hObject, eventdata, handles)
% hObject    handle to applyAngle_ui (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angle = get(handles.angle_ui, 'String'); % Get file name
data = get(handles.img_ui, 'UserData')
img_data = data.img_data;
data_rotated = rotate3d(img_data, angle);
data_proj = projection(data_rotated);
imagesc(data_proj);
cl = caxis;
caxis([cl(1), cl(2)-700000]);

function a_weighted=weightDepth(a)
w = linspace(1,0,size(a,2));
a_weighted = bsxfun(@times, a, w);