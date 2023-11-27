import React, { Fragment, useState } from 'react';
import { Row, Col, Card, CardBody, Form, FormGroup, Label, Input } from 'reactstrap';
import { H5 ,Btn} from '../../../AbstractElements'
import {CardHeader,CardFooter} from 'reactstrap';
// import FooterCard from '../Common/FooterCard';
import { Data } from './Data';
import * as yup from 'yup';
import { useFormik } from 'formik';
import { POSTFILE } from '../../../api/Axios';
import { toast } from 'react-toastify';

const BasicFormControlClass = () => {
    const [loading,setLoading]=useState(false);
    const validationSchema = yup.object({
        name: yup.string().required().min(2),
        email: yup.string().required('Please enter your email').email(),
        phone : yup.string().required(),
        street : yup.string().required(),
        city: yup.string().required(),
        state: yup.string().required(),
        zip: yup.number().required(),
        country: yup.string().required(),
        job_designation:yup.string().required(),
    });

    const formik = useFormik({
        initialValues: {
            name: '',
            email: '', 
            phone:'',
            street:'',
            city:'',
            state:'',
            country:'', 
            zip:'',   
            job_designation:'',   
            profile_image: null,
            role:"member"
        },
        validationSchema: validationSchema,
     
        onSubmit: async (values) => {
                // const formData = new FormData();
                // for (let value in values) {
                //     formData.append(value, values[value]);
                // }
                setLoading(true)
                const response= await POSTFILE('/user',values,setLoading);
                console.log(values)
                if(response){
                    setLoading(false)
                    toast.success(response.data.message)
                    console.log(response)
                }
                formik.resetForm();
            },
       });
    return (
        <Fragment>
            <Card>
            <CardHeader > <H5> Add Member</H5>   </CardHeader>
                <Form className="form theme-form" onSubmit={formik.handleSubmit} method='post'>
                    <CardBody>
                        <Row className='mb-3'>

                        { Data.map((item, index) => ( 
                            <Col  md="4" key={index}>
                                <FormGroup>
                                    <Label htmlFor="exampleFormControlInput1">{item.title}</Label>
                                    { item.type =='file' ?
                                    <Input className="form-control"  name={item.name} type={item.type} onChange= {(e) => formik.setFieldValue(item.name, e.currentTarget.files[0]) } />
                                   :
                                    <Input className="form-control" name={item.name} type={item.type} placeholder={item.placeholder}  value={formik.values[item.name]} onBlur={formik.handleBlur} onChange=  {formik.handleChange } />
                                    }            
                                    <small style={{color : "red"}}>  {formik.touched[item.name] && formik.errors[item.name] }</small>
                                </FormGroup>
                            </Col>

                         ))}

                        </Row>
                      
                    </CardBody>
                    <CardFooter className="text-end">
                        <button className='btn' disabled={loading}>{loading?'Adding':'Add Member'}</button>
                        <button className='btn' type='button' disabled={loading} onClick={()=>formik.resetForm()}>Cancel</button>
                    </CardFooter>
                </Form>
            </Card>
        </Fragment>
    );
};

export default BasicFormControlClass;