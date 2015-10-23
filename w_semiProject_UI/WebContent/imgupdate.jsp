<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
  		<!--  header -->  
<%@ include file="top.jsp"%>

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 45px;
	}


	.btn-file {
	  position: relative;
	  overflow: hidden;
	}
	.btn-file input[type=file] {
	  position: absolute;
	  top: 0;
	  right: 0;
	  min-width: 100%;
	  min-height: 100%;
	  font-size: 100px;
	  text-align: right;
	  filter: alpha(opacity=0);
	  opacity: 0;
	  background: red;
	  cursor: inherit;
	  display: block;
	}
	input[readonly] {
	  background-color: white !important;
	  cursor: text !important;
	}
</style>

<script>
	$(document).on('change', '.btn-file :file', function() {
		  var input = $(this),
		      numFiles = input.get(0).files ? input.get(0).files.length : 1,
		      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		  input.trigger('fileselect', [numFiles, label]);
		});
	
		$(document).ready( function() {
		    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
		        
		        var input = $(this).parents('.input-group').find(':text'),
		            log = numFiles > 1 ? numFiles + ' files selected' : label;
		        
		        if( input.length ) {
		            input.val(log);
		        } else {
		            if( log ) alert(log);
		        }
		        
		    });
		});
</script>


<div>
	
	<img src="img/boardupdate.png" width="300px">
	<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			
			<table width="500px">				
				<tr>	
					<th>title</th>	
					<td align="left">
						<input class="form-control input-sm" placeholder="������ �Է��ϼ���">
					</td>	
				</tr>
				
				<tr>
					<th>�̹���</th>
					<td>
			            <div class="input-group">
			                <!-- placeholder�� ���� �÷ȴ� �̹��� ������ �;��Ұ� �����ϴ�.  -->
			                <input type="text" class="form-control input-sm" placeholder="Try selecting one file" readonly >
			                <span class="input-group-btn">
			                    <span class="btn btn-success btn-file btn-sm">
			                        ImageUpload<input type="file" multiple>
			                    </span>
			                </span>
			            </div>
					</td>
				</tr>
				
				
				<tr>	
					<th colspan="2">Content</th>		
				</tr>
				
				<tr>	
					<td colspan="2"  height="500px">
						<textarea class="form-control" rows="10" id="comment" placeholder="������ �Է��ϼ���"></textarea>
					</td>		
				</tr>
			</table>				
	
			
			<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			<button type="button" class="btn btn-success btn-sm">�������Ϸᡡ</button>
			<button type="button" class="btn btn-success btn-sm">��������ҡ�</button>
			
</div>




		<!--  bottom -->
<%@ include file="bottom.jsp"%>