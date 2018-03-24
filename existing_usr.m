function varargout = existing_usr(varargin)
% EXISTING_USR MATLAB code for existing_usr.fig
%      EXISTING_USR, by itself, creates a new EXISTING_USR or raises the existing
%      singleton*.
%
%      H = EXISTING_USR returns the handle to a new EXISTING_USR or the handle to
%      the existing singleton*.
%
%      EXISTING_USR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXISTING_USR.M with the given input arguments.
%
%      EXISTING_USR('Property','Value',...) creates a new EXISTING_USR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before existing_usr_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to existing_usr_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help existing_usr

% Last Modified by GUIDE v2.5 15-Mar-2018 11:16:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @existing_usr_OpeningFcn, ...
                   'gui_OutputFcn',  @existing_usr_OutputFcn, ...
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


% --- Executes just before existing_usr is made visible.
function existing_usr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to existing_usr (see VARARGIN)

% Choose default command line output for existing_usr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes existing_usr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = existing_usr_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
set(handles.text4, 'String', '');
varargout{1} = handles.output;


% --- Executes on button press in Browse_existing.
function Browse_existing_Callback(hObject, eventdata, handles)
% hObject    handle to Browse_existing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
usr_name_str = get(handles.usr_name_e,'String'); %edit1 being Tag of ur edit box
 if isempty(usr_name_str)
   fprintf('Error\n');
   set(handles.text4, 'String', 'No such user');
 end
 
 
 
 [filename pathname] = uigetfile({'*.bmp'},'File Selector');
image = strcat(pathname, filename);

[Template_new, Mask_new]=createiristemplate(image);
 
cd ./user_data
path1 = ['./' usr_name_str]
cd(path1)
filename_template = [usr_name_str,'template.mat'];
filename_mask = [usr_name_str,'mask.mat'];

Template_original = load(filename_template,'Template')
Mask_original = load(filename_mask,'Mask');
cd ../..

(mean(mean(Template_original.Template - Template_new)))^2

if ((mean(mean(Template_original.Template - Template_new)))^2<10^-4)
    set(handles.text4, 'String', 'Authenticated');
else
    set(handles.text4, 'String', 'Not Authenticated');
end

 
 


function usr_name_e_Callback(hObject, eventdata, handles)
% hObject    handle to usr_name_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of usr_name_e as text
%        str2double(get(hObject,'String')) returns contents of usr_name_e as a double


% --- Executes during object creation, after setting all properties.
function usr_name_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to usr_name_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
