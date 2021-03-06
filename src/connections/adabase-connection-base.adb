--
--  Copyright (c) 2015 John Marino <draco@marino.st>
--
--  Permission to use, copy, modify, and distribute this software for any
--  purpose with or without fee is hereby granted, provided that the above
--  copyright notice and this permission notice appear in all copies.
--
--  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
--  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
--  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
--  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
--  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
--  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
--  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--

package body AdaBase.Connection.Base is

   ------------------
   --  autoCommit  --
   ------------------
   overriding
   function autoCommit (conn : Base_Connection) return Boolean
   is
   begin
      return conn.prop_auto_commit;
   end autoCommit;


   -------------------
   --  setCaseMode  --
   -------------------
   overriding
   procedure setCaseMode (conn : out Base_Connection; mode : AD.CaseMode)
   is
   begin
      conn.prop_case_mode := mode;
   end setCaseMode;


   ----------------
   --  caseMode  --
   ----------------
   overriding
   function caseMode (conn : Base_Connection) return AD.CaseMode
   is
   begin
      return conn.prop_case_mode;
   end caseMode;


   --------------------
   --  setErrorMode  --
   --------------------
   overriding
   procedure setErrorMode (conn : out Base_Connection; mode : AD.ErrorMode)
   is
   begin
      conn.prop_error_mode := mode;
   end setErrorMode;


   -----------------
   --  ErrorMode  --
   -----------------
   overriding
   function ErrorMode (conn : Base_Connection) return AD.ErrorMode
   is
   begin
      return conn.prop_error_mode;
   end ErrorMode;


   ---------------------
   --  setStringMode  --
   ---------------------
   overriding
   procedure setStringMode (conn : out Base_Connection; mode : AD.StringMode)
   is
   begin
      conn.prop_string_mode := mode;
   end setStringMode;


   ------------------
   --  stringMode  --
   ------------------
   overriding
   function stringMode (conn : Base_Connection) return AD.StringMode
   is
   begin
      return conn.prop_string_mode;
   end stringMode;


   --------------------
   --  setMaxBlobSize  --
   --------------------
   overriding
   procedure setMaxBlobSize (conn    : out Base_Connection;
                             maxsize :     AD.BLOB_maximum)
   is
   begin
      conn.prop_max_blob := maxsize;
   end setMaxBlobSize;


   -------------------
   --  maxBlobSize  --
   -------------------
   overriding
   function maxBlobSize (conn : Base_Connection) return AD.BLOB_maximum
   is
   begin
      return conn.prop_max_blob;
   end maxBlobSize;


   ----------------------------
   --  transactionIsolation  --
   ----------------------------
   overriding
   function transactionIsolation (conn : Base_Connection)
                                  return AD.TransIsolation
   is
   begin
      return conn.prop_trax_isolation;
   end transactionIsolation;


   -----------------
   --  connected  --
   -----------------
   overriding
   function connected (conn : Base_Connection) return Boolean
   is
   begin
      return conn.prop_connected;
   end connected;


   ---------------------
   --  serverVersion  --
   ---------------------
   overriding
   function serverVersion (conn : Base_Connection)
                           return AD.textual
   is
   begin
      return conn.info_server_version;
   end serverVersion;


   ------------------
   --  serverInfo  --
   ------------------
   overriding
   function serverInfo (conn : Base_Connection) return AD.textual
   is
   begin
      return conn.info_server;
   end serverInfo;


   ----------------------
   --   clientVersion  --
   ----------------------
   overriding
   function clientVersion (conn : Base_Connection)
                           return AD.textual
   is
   begin
      return conn.info_client_version;
   end clientVersion;


   ------------------
   --  clientInfo  --
   ------------------
   overriding
   function clientInfo (conn : Base_Connection) return AD.textual
   is
   begin
      return conn.info_client;
   end clientInfo;

   ------------------------------------------------------------------------
   --  PRIVATE ROUTINES NOT COVERED BY INTERFACES                        --
   ------------------------------------------------------------------------

   -----------
   --  SUS  --
   -----------
   function SUS (fixed : String) return AD.textual
   is
   begin
      return AD.SU.To_Unbounded_String (Source => fixed);
   end SUS;


   -----------
   --  USS  --
   -----------
   function USS (loose : AD.textual) return String
   is
   begin
      return AD.SU.To_String (Source => loose);
   end USS;

end AdaBase.Connection.Base;
