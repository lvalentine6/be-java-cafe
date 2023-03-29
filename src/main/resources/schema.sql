DROP TABLE IF EXISTS CAFEUSER, ARTICLE, REPLY;

CREATE TABLE CAFEUSER
(
    USER_ID  VARCHAR PRIMARY KEY,
    PASSWORD VARCHAR NOT NULL,
    NAME     VARCHAR NOT NULL,
    EMAIL    VARCHAR NOT NULL
);

CREATE TABLE ARTICLE
(
    ARTICLE_ID INT NOT NULL,
    USER_ID    VARCHAR NOT NULL,
    TITLE      VARCHAR NOT NULL,
    CONTENTS   VARCHAR NOT NULL,
    TIME       VARCHAR NOT NULL,
    DELETED    BOOLEAN NOT NULL,
    PRIMARY KEY (ARTICLE_ID, DELETED),
    FOREIGN KEY (USER_ID) REFERENCES CAFEUSER (USER_ID)
);

CREATE TABLE REPLY
(
    REPLY_ID   INT PRIMARY KEY,
    USER_ID    VARCHAR NOT NULL,
    ARTICLE_ID INT NOT NULL,
    CONTENTS   VARCHAR NOT NULL,
    TIME       VARCHAR NOT NULL,
    DELETED    BOOLEAN,
    CONSTRAINT ARTICLE_DELETE FOREIGN KEY (ARTICLE_ID, DELETED) REFERENCES ARTICLE (ARTICLE_ID, DELETED) ON UPDATE CASCADE
);
