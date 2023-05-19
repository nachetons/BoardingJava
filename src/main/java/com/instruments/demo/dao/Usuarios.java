package com.instruments.demo.dao;

import java.util.Date;

public class Usuarios {
        private String userCode;
        private String name;
        private String surname;
        private String rol;
        private Date dateCreated;

        public Usuarios() {
        }

        public String getUserCode() {
                return userCode;
        }

        public void setUserCode(String userCode) {
                this.userCode = userCode;
        }

        public String getName() {
                return name;
        }

        public void setName(String name) {
                this.name = name;
        }

        public String getSurname() {
                return surname;
        }

        public void setSurname(String surname) {
                this.surname = surname;
        }

        public String getRol() {
                return rol;
        }

        public void setRol(String rol) {
                this.rol = rol;
        }

        public Date getDateCreated() {
                return dateCreated;
        }

        public void setDateCreated(Date dateCreated) {
                this.dateCreated = dateCreated;
        }


}
