import React, { Fragment, useState , useEffect} from 'react';
import DataTable from 'react-data-table-component';
import {  tableColumns } from './Defaultdata';
import { GET } from '../../../api/Axios';

const DataTableComponent = () => {
  const [data, setData] = useState([]);
  const [loading,setLoading]=useState(false)

  const fetchData = async () => {
    setLoading(true)
    const response = await GET('/user',setLoading);
    if(response){
      setData(response.data)
    }  
    
  };

  useEffect(() => {
    fetchData();
  }, []);

  return (
    <Fragment>
      <DataTable
        data={data}
        columns={tableColumns}
        striped={true}
        center={true}
        pagination
      />
    </Fragment>
  );
};

export default DataTableComponent;
