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

<form action="uploadres" method="post" enctype="multipart/form-data">
<div>
	
	<h1>�̹����Խ���<small>�̹��� �Խ��� �۾��� ���� form</small></h1>
	
	<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			
			<table width="500px">				
				<tr>	
					<th>title</th>	
					<td align="left">
						<input class="form-control input-sm" name="animalname" placeholder="������ �Է��ϼ���">
					</td>	
				</tr>
				
				<tr>
					<th>�̹���</th>
					<td>
			            <div class="input-group">
			                <input type="text" class="form-control input-sm" placeholder="Try selecting one file" readonly >
			                <span class="input-group-btn">
			                    <span class="btn btn-success btn-file btn-sm">
<!-- 			                        Browse&hellip; <input type="file" multiple> -->
			                        ImageUpload<input name="upload" type="file" multiple>
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
						<textarea class="form-control" rows="10" id="comment" name="animalfeature" placeholder="������ �Է��ϼ���">�̸�:
���:
����:
						</textarea>
					</td>		
				</tr>
			</table>				
	
			
			<table><tr height="30px"><!-- ���� ������ ĭ ����� --><td></td></tr></table>
			<button type="submit" class="btn btn-success btn-sm">���� �� ����</button>
			<button type="button" class="btn btn-success btn-sm">���롡���ҡ�</button>
			
</div>

</form>


		<!--  bottom -->
<%@ include file="bottom.jsp"%>