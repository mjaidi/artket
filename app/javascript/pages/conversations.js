if(document.getElementById("conversations")) {
  if(document.querySelector(".conversation")) {
  document.querySelector(".conversation").classList.add("conversation-active");
  document.querySelector(".messages").classList.add("messages-active");
  document.querySelector(".flex").classList.add("flex-active");

  document.querySelectorAll(".conversation").forEach((conversation) => {
    conversation.addEventListener('click', (event) => {
      document.querySelectorAll(".conversation").forEach(conversation => conversation.classList.remove("conversation-active"));
      document.querySelectorAll(".flex").forEach(form => form.classList.remove("flex-active"));
      document.querySelectorAll(".messages").forEach(messages => messages.classList.remove("messages-active"));
      event.currentTarget.classList.add("conversation-active");
      const conversationNumber = conversation.dataset.conversationNumber;
      document.getElementById(`messages${conversationNumber}`).classList.add("messages-active");
      document.getElementById(`new-message${conversationNumber}`).classList.add("flex-active");
    });
  });
};
};  