function attenduser(member_id,board_no_seq,board_viewnum,board_peoplelimit){
	const attend_user = document.getElementsByClassName("attends");
	let attend_users = '';
	let bool = false;
	
	if(attend_user.length == 0)
		location.href = 'meetingboard.do?command=attendupdate&attend_user='+member_id+'&board_no_seq='+board_no_seq+'&board_dto.board_viewnum='+board_viewnum;
	else{
		for(let i = 0; i <attend_user.length; ++i ){
			if(attend_user[i].innerHTML != ''){
				if(attend_user[i].innerHTML == member_id){
					bool = true;
					alert('이미 참여 하였습니다.');
					break;
				}
			}
			if(!bool){
				if(parseInt(board_peoplelimit) <= attend_user[i].length){
					alert("모임의 인원이 꽉 찼습니다.");
					break;
				}else{
					location.href = 'meetingboard.do?command=attendupdate&attend_user='+member_id+'&board_no_seq='+board_no_seq+'&board_dto.board_viewnum='+board_viewnum;
					break;
				}
			}
		}
	}	
}

$(function(){
	let click_id = '';
	$('html').click(function(e){
		if($(e.target).hasClass("attends")){
			const X = window.event.clientX + window.pageXOffset;
			const Y = window.event.clientY + window.pageYOffset;
				
			$("#pop_up").css({"display" : "block"});
			$("#pop_up").offset({top : Y, left: X});
			click_id = $(e.target).html();
		}else if($(e.target).is("#send_message")){
			send_message(click_id);
		}else if($(e.target).is("#add_friend")){
			add_friend(click_id);
		}else{
			$("#pop_up").css({"display" : "none"});
		}
	})
})
function send_message(id){
	window.open('whisper.do?command=resend&message_receive_id='+id,'메세지 함','width=360, height=300');
}

function add_friend(id){
	
$.ajax({
	url : "friend.do",
	type : "post",
	data : 'command=insert&friend_id='+id
}).done(function(data){
	
})
}

