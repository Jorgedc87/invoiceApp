import axios from "axios";
import { getApiUrl } from "../utils/getApiUrl"

export const getBooks = () => {
  const apiUrl = getApiUrl('book/all')
  return axios.get(apiUrl).then(res => res.data);
}