import axios from 'axios';
import { ToastContainer, toast } from 'react-toastify';

const API = axios.create({ baseURL: process.env.REACT_APP_BACKEND_URL });

API.interceptors.request.use((req) => {
  const token = localStorage.getItem('token');
  if (token) {
    req.headers.authorization = token;
  }
  return req;
});

export const POST = async (url,data,loading) => {
  try {
    const response = await API.post(url, data);
    return response;
  } catch (error) {
    if (error.response && error.response.data.message) {
      error.message = error.response.data.message;
    }
    toast.error(error.message);
    loading(false);
  }
};
export const POSTFILE = async (url,data,loading) => {
  try {
    const token = localStorage.getItem('token');
    
    const response = await axios.post(
      process.env.REACT_APP_BACKEND_URL+url, 
      data,
      {
        headers: {
          'Content-Type': 'multipart/form-data',
          'authorization':`${token}`,
        }
      }
    );
    return response;
  } catch (error) {
    if (error.response && error.response.data.message) {
      error.message = error.response.data.message;
    }
    toast.error(error.message);
    loading(false);
  }
};

export const GET = async (url,loading) => {
  try {
    const response = await API.get(url);
    loading(false);
    return response;
  } catch (error) {
    if (error.response && error.response.data.message) {
      error.message = error.response.data.message;
    }
    toast.error(error.message);
    console.log(error.message)
    loading(false);
  }
};

export const UPDATE = async (url,data,loading) => {
  try {
    const response = await API.patch(url, data);
    return response;
  } catch (error) {
    if (error.response && error.response.data.message) {
      error.message = error.response.data.message;
    }
    toast.error(error.message);
    loading(false);
  }
};
export const DELETE = async (url,loading) => {
  try {
    const response = await API.delete(url);
    loading(false);
    return response;
  } catch (error) {
    if (error.response && error.response.data.message) {
      error.message = error.response.data.message;
    }
    toast.error(error.message);
    console.log(error.message)
    loading(false);
  }
};