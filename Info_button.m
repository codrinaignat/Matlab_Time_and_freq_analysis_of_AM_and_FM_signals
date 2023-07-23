function varargout = Info_button(varargin)
% INFO_BUTTON MATLAB code for Info_button.fig
%      INFO_BUTTON, by itself, creates a new INFO_BUTTON or raises the existing
%      singleton*.
%
%      H = INFO_BUTTON returns the handle to a new INFO_BUTTON or the handle to
%      the existing singleton*.
%
%      INFO_BUTTON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFO_BUTTON.M with the given input arguments.
%
%      INFO_BUTTON('Property','Value',...) creates a new INFO_BUTTON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Info_button_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Info_button_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Info_button

% Last Modified by GUIDE v2.5 11-May-2022 22:47:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Info_button_OpeningFcn, ...
                   'gui_OutputFcn',  @Info_button_OutputFcn, ...
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


% --- Executes just before Info_button is made visible.
function Info_button_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Info_button (see VARARGIN)

% Choose default command line output for Info_button
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Info_button wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Info_button_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
