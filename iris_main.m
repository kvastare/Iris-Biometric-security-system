function varargout = iris_main(varargin)
% IRIS_MAIN MATLAB code for iris_main.fig
%      IRIS_MAIN, by itself, creates a new IRIS_MAIN or raises the existing
%      singleton*.
%
%      H = IRIS_MAIN returns the handle to a new IRIS_MAIN or the handle to
%      the existing singleton*.
%
%      IRIS_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IRIS_MAIN.M with the given input arguments.
%
%      IRIS_MAIN('Property','Value',...) creates a new IRIS_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before iris_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to iris_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help iris_main

% Last Modified by GUIDE v2.5 23-Mar-2018 12:18:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @iris_main_OpeningFcn, ...
                   'gui_OutputFcn',  @iris_main_OutputFcn, ...
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


% --- Executes just before iris_main is made visible.
function iris_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to iris_main (see VARARGIN)

% Choose default command line output for iris_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow('iris_image.jpg');



% UIWAIT makes iris_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = iris_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in new_user_btn.
function new_user_btn_Callback(hObject, eventdata, handles)
% hObject    handle to new_user_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_usr_email

% --- Executes on button press in existing_user.
function existing_user_Callback(hObject, eventdata, handles)
% hObject    handle to existing_user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
existing_usr
